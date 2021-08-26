# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
Replicated small test case locally.
"""

import os

cruise_id = 'FK210409'
os.chdir('/Users/atlanticindianocean/Desktop/scratch/mgds/work/Falkor/'+cruise_id+'/Subastian')

dive_ids = []
paths2jsons=[]
for i in range(len(os.listdir())):
    dive = os.listdir()[i].split('_')
    dive_ids.append(dive[1])
    paths2jsons.append('/Users/atlanticindianocean/Desktop/scratch/mgds/work/Falkor/'+cruise_id+'/Subastian/'+cruise_id+'_'+dive_ids[i]+'/Sealog/'+dive_ids[i]+'_loweringRecord.json')
print(paths2jsons)

#print('hello world {}'.format('emily'))
