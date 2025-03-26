""" Utils module """
from celery.schedules import crontab
from zoneinfo import ZoneInfo


def get_timezone_from_crontab(schedule: crontab) -> str:
	""" Return timezone from scheduler """
	tz = schedule.tz
	if isinstance(tz, ZoneInfo):
		return tz.key
	return tz.zone
