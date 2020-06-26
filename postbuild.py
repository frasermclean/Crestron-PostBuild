import pysftp

# variables (edit these to suit your environment)
hostname = "rmc3"
username = "fez"
progNum = 1

# get program directory
progDir = "/program0" + str(progNum) + "/"

with pysftp.Connection(hostname, username=username, default_path=progDir) as sftp:
  print(sftp.listdir())