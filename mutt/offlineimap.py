#! /usr/bin/env python
import getpass, re, subprocess, os
from os.path import expanduser, join
def get_keychain_pass(account=None, service=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-generic-password',
        'user': getpass.getuser(),
        'account': account,
        'service': service,
        'keychain': join(expanduser('~'), 'library/Keychains/login.keychain'),
    }
    command = "sudo -u %(user)s %(security)s -v %(command)s -g -a %(account)s -s %(service)s %(keychain)s" % params
    print command
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    returnval = re.match(r'password: "(.*)"', outtext)
    return returnval.group(1)
