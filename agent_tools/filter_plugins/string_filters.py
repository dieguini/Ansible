# This was never used but is a nice to know/have
import re

def contains_substring(value, substring):
    return [item for item in value if substring in item]

def match_regex(value, pattern):
    regex = re.compile(pattern)
    return [item for item in value if regex.match(item)]

class FilterModule(object):
    def filters(self):
        return {
            'contains_substring': contains_substring
        }
