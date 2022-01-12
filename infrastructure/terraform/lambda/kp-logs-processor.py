from __future__ import print_function
import json
import logging
import os
import sys
from datetime import datetime

from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def timestampToUTC(timestamp):
  dateTime = datetime.fromtimestamp(timestamp)
  return dateTime

def datetimeToTimestamp(dateTimeString):
  dateTime = datetime.strptime(dateTimeString, "%Y-%m-%d %H:%M:%S")
  return int(datetime.timestamp(dateTime))

def isTimestampInRange(timestamp, initTimestamp, endTimestamp):
  if timestamp >= initTimestamp and timestamp <= endTimestamp:
    return True

def processLog(init_datetime, end_datetime, line, targetSeverity):
    line = list(map(str, line.split()))

    dateTime = timestampToUTC(float(line[0]))
    ip       = line[1]
    severity = line[2]
    message  = ' '.join(line[3:]).strip('"')

    if severity == targetSeverity and isTimestampInRange(int(line[0]), datetimeToTimestamp(init_datetime), datetimeToTimestamp(end_datetime)):
      print(str(dateTime) + ' - ' + ip + ' - ' + str(message))
      return str(dateTime) + ' - ' + ip + ' - ' + str(message)

def lambda_handler(event, context):

    logger.info("Event: " + str(event))

    init_datetime = event['init_datetime']
    end_datetime  = event['end_datetime']
    logLine       = event['LogLine']

    s3_ingestion_logs = os.environ['S3_INGESTION_LOGS']
    s3_transdormation_logs = os.environ['S3_TRANSFORMATION_LOGS']

    defaultSeverity = 'CRITICAL'
    logProcessed = processLog(init_datetime, end_datetime, logLine, defaultSeverity)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": logProcessed,
        }),
    }

