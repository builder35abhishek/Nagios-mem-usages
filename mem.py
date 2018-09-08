import os

command = os.popen('free')
s=(command.read())
d = s.split()
totoal=int(d[7])
used=int(d[8])
free=int(d[9])
memused=(100*used)/totoal
if memused >= 80 and memused <= 89:
        print memused, "%memory used"
        sys.exit(1)
elif memused >= 90:
        print memused, "% memory used"
else:
        print memused, "% memory used"
