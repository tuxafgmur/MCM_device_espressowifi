/*
 * Copyright (C) 2013 Paul Kocialkowski <contact@paulk.fr>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>
#include <fcntl.h>
#include <errno.h>
#include <math.h>
#include <sys/types.h>
#include <linux/ioctl.h>
#include <linux/input.h>

#include <hardware/sensors.h>
#include <hardware/hardware.h>

#define LOG_TAG "piranha_sensors"
#include <utils/Log.h>

#include "piranha_sensors.h"

struct bh1721_data {
	char path_enable[PATH_MAX];
	char path_delay[PATH_MAX];
};

int bh1721_init(struct piranha_sensors_handlers *handlers,
	struct piranha_sensors_device *device)
{
	struct bh1721_data *data = NULL;
	char path[PATH_MAX] = { 0 };
	int input_fd = -1;
	int rc;

	if (handlers == NULL)
		return -EINVAL;

	data = (struct bh1721_data *) calloc(1, sizeof(struct bh1721_data));

	input_fd = input_open("light_sensor");
	if (input_fd < 0) {
		ALOGE("%s: Unable to open input", __func__);
		goto error;
	}

	rc = sysfs_path_prefix("light_sensor", (char *) &path);
	if (rc < 0 || path[0] == '\0') {
		ALOGE("%s: Unable to open sysfs", __func__);
		goto error;
	}

	snprintf(data->path_enable, PATH_MAX, "%s/enable", path);
	snprintf(data->path_delay, PATH_MAX, "%s/poll_delay", path);

	handlers->poll_fd = input_fd;
	handlers->data = (void *) data;

	return 0;

error:
	if (data != NULL)
		free(data);

	if (input_fd >= 0)
		close(input_fd);

	handlers->poll_fd = -1;
	handlers->data = NULL;

	return -1;
}

int bh1721_deinit(struct piranha_sensors_handlers *handlers)
{
	if (handlers == NULL)
		return -EINVAL;

	if (handlers->poll_fd >= 0)
		close(handlers->poll_fd);
	handlers->poll_fd = -1;

	if (handlers->data != NULL)
		free(handlers->data);
	handlers->data = NULL;

	return 0;
}

int bh1721_activate(struct piranha_sensors_handlers *handlers)
{
	struct bh1721_data *data;
	int rc;

	if (handlers == NULL || handlers->data == NULL)
		return -EINVAL;

	data = (struct bh1721_data *) handlers->data;

	rc = sysfs_value_write(data->path_enable, 1);
	if (rc < 0) {
		ALOGE("%s: Unable to write sysfs value", __func__);
		return -1;
	}

	handlers->activated = 1;

	return 0;
}

int bh1721_deactivate(struct piranha_sensors_handlers *handlers)
{
	struct bh1721_data *data;
	int rc;

	if (handlers == NULL || handlers->data == NULL)
		return -EINVAL;

	data = (struct bh1721_data *) handlers->data;

	rc = sysfs_value_write(data->path_enable, 0);
	if (rc < 0) {
		ALOGE("%s: Unable to write sysfs value", __func__);
		return -1;
	}

	handlers->activated = 1;

	return 0;
}

int bh1721_set_delay(struct piranha_sensors_handlers *handlers, int64_t delay)
{
	struct bh1721_data *data;
	int rc;

	if (handlers == NULL || handlers->data == NULL)
		return -EINVAL;

	data = (struct bh1721_data *) handlers->data;

	rc = sysfs_value_write(data->path_delay, delay);
	if (rc < 0) {
		ALOGE("%s: Unable to write sysfs value", __func__);
		return -1;
	}

	return 0;
}

float bh1721_convert(int value)
{
	return value * 0.712f;
}

int bh1721_get_data(struct piranha_sensors_handlers *handlers,
	struct sensors_event_t *event)
{
	struct input_event input_event;
	int input_fd;
	int rc;

	if (handlers == NULL || event == NULL)
		return -EINVAL;

	input_fd = handlers->poll_fd;
	if (input_fd < 0)
		return -EINVAL;

	memset(event, 0, sizeof(struct sensors_event_t));
	event->version = sizeof(struct sensors_event_t);
	event->sensor = handlers->handle;
	event->type = handlers->handle;

	do {
		rc = read(input_fd, &input_event, sizeof(input_event));
		if (rc < (int) sizeof(input_event))
			break;

		if (input_event.type == EV_REL) {
			if (input_event.code == REL_MISC)
				event->light = bh1721_convert(input_event.value);
		} else if (input_event.type == EV_SYN) {
			if (input_event.code == SYN_REPORT)
				event->timestamp = input_timestamp(&input_event);
		}
	} while (input_event.type != EV_SYN);

	return 0;
}

struct piranha_sensors_handlers bh1721 = {
	.name = "BH1721",
	.handle = SENSOR_TYPE_LIGHT,
	.init = bh1721_init,
	.deinit = bh1721_deinit,
	.activate = bh1721_activate,
	.deactivate = bh1721_deactivate,
	.set_delay = bh1721_set_delay,
	.get_data = bh1721_get_data,
	.activated = 0,
	.needed = 0,
	.poll_fd = -1,
	.data = NULL,
};
