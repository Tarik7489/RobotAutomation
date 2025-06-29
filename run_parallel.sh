#!/bin/bash

echo "Running Robot Framework tests in parallel..."
pabot --processes 2 --outputdir results TestCases/login_test.robot TestCases/MyProfile_test.robot
