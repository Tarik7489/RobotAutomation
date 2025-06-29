import subprocess
import os

# Define the desired output directory
output_dir = 'results'



# Execute the Robot Framework tests with the specified output directory
subprocess.run([
    'robot',
    '--listener', 'RetryFailed:3',
    '--outputdir', output_dir,
    # 'TestCases/login_test.robot',
    # 'TestCases/MyProfile_test.robot',
    # 'TestCases/InstantMeeting_test.robot',
    # 'TestCases/Schedule_Meeting_test.robot',
    # 'TestCases/Webinar_test.robot'
    'TestCases/Presence_Test.robot'

])
