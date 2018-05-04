#!/usr/bin/env python3

import re
import feedparser
import zipfile

#***********************************************#
#                                               #
#                                               #
#             Author: Yevhen Kalina             #
#                                               #
#                                               #
#***********************************************#

logfile = '/app/old.log'

indexPattern = r"remote_addr=[8]\W[8]\W[8]\W[8]"
goodStatus = r"status=[2][0][0]"

hint = 'http://hint.macpaw.io'


def etag_parser(hint):
    a = int(''.join(feedparser.parse(hint).etag.split())[1:+3])
    return a


def search_by_pattern(file, pattern, find):
    status_pattern = r"status=\d\d\d"
    statuses = []
    repeats = []

    f = open(file, 'r')
    for line in f:

        if find == 'mostBadStatus?':
            current_status = ''.join(re.findall(status_pattern, line))
            if not re.match(pattern, current_status):
                current_status = ''.join(current_status.split())[-3:]
                statuses.append(current_status)

        if find == 'numberOfRequest?':
            current_status = ''.join(re.findall(pattern, line))
            if re.match(pattern, current_status):
                repeats.append(current_status)
                filter(None, repeats)
    f.close()

    if find == 'mostBadStatus?':
        return int(max(set(statuses), key=statuses.count))
    if find == 'numberOfRequest?':
        return len(repeats)
    else:
        print('Unknown find request!')


firstNumber = search_by_pattern(logfile, goodStatus, 'mostBadStatus?')
secondNumber = search_by_pattern(logfile, indexPattern, 'numberOfRequest?')
thirdNumber = etag_parser(hint)

print('First number is: {0}'.format(firstNumber))
print('Second number is: {0}'.format(secondNumber))
print('Third number is: {0}'.format(thirdNumber))

password = str(firstNumber + secondNumber + thirdNumber)
print('Password is:', password)

with zipfile.ZipFile('/tmp/additional.zip', 'r') as zip:
    with zip.open('tmp/internship-additional', pwd=password.encode('cp850', 'replace')) as file:
        print(file.read())
