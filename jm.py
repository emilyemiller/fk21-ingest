#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 15 08:32:03 2021

@author: atlanticindianocean
"""

#!/usr/bin/env python3

import os

from google.oauth2 import service_account
from google.cloud import storage
import re

client = storage.Client()
blobs = client.list_blobs('2021fkdata',prefix="FK210409/Subastian")
dirs = []
for blob in blobs:
    dirname = os.path.dirname(blob.name);
    if dirname not in dirs:
        dirs.append(dirname)
dirs.sort()
for dirname in dirs:
    print(dirname)