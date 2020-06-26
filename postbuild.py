import sys
import pysftp

# print command line options
def printHelp():
  print('Crestron Simpl#Pro Post Build Script')
  print('Usage: ', sys.argv[0], 'hostname username')

# connect to sftp server
def pushFileToServer(hostname, username, progNum):
  # get program directory
  progDir = "/program0" + str(progNum) + "/"

  with pysftp.Connection(hostname, username=username, default_path=progDir) as sftp:
    print(sftp.listdir())

# code entry point
if (len(sys.argv) != 4):
  printHelp()
  exit()

# get variables from arguments
hostname = sys.argv[1]
username = sys.argv[2]
progNum = sys.argv[3]

pushFileToServer(hostname, username, progNum)
