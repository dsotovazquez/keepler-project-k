#!/usr/bin/python

from __future__ import print_function

import sys
from datetime import datetime

def order(init_datetime, end_datetime):
  pass

def timestampToUTC(timestamp):
  dateTime = datetime.fromtimestamp(timestamp)
  return dateTime

def datetimeToTimestamp(dateTimeString):
  dateTime = datetime.strptime(dateTimeString, "%Y-%m-%d %H:%M:%S")
  return int(datetime.timestamp(dateTime))

def isTimestampInRange(timestamp, initTimestamp, endTimestamp):
  if timestamp >= initTimestamp and timestamp <= endTimestamp:
    return True

def processLog(init_datetime, end_datetime, log, targetSeverity):
  for line in log:
    if 'q' == line.rstrip():
      break

    line = list(map(str, line.split()))
    dateTime = timestampToUTC(float(line[0]))
    ip       = line[1]
    severity = line[2]
    message  = ' '.join(line[3:]).strip('"')

    if severity == targetSeverity and isTimestampInRange(int(line[0]), datetimeToTimestamp(init_datetime), datetimeToTimestamp(end_datetime)):
      print(str(dateTime) + ' - ' + ip + ' - ' + str(message))

def main():
  init_datetime = ' '.join(map(str, list(map(str, input().split()))[1:3]))
  end_datetime  = ' '.join(map(str, list(map(str, input().split()))[1:3]))
  defaultSeverity = 'CRITICAL'

  logHeader = input()
  processLog(init_datetime, end_datetime, sys.stdin, defaultSeverity)

if __name__ == '__main__':
    sys.exit(main())

