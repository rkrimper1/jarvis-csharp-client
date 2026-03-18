#!/bin/sh
#    Proprietary and Confidential
#
#    This source code is the property of:
#
#     Robert Krimper (c) 2026
#
#     https://www.krimper.com
#
#    Author:         Robert Krimper, https://www.linkedin.com/in/robert-krimper
#    Modified by:    
#    Module:         create_client.sh
#    Description:    Creates a zip file of a working gRPC client for C#.
#                    This will be labeled with the current version of jarvis code.
#
#

ZIP_DIR=jarvis-csharp-client

# Copy all the required files and directories in order to run the C# Client
rm -rf jarvis-client-version_number-csharp.zip
rm -rf $ZIP_DIR
mkdir -p $ZIP_DIR

# Copy the client README.md
cp client_README.md $ZIP_DIR/README.md

# Copy essential client single files
cp jarvis-csharp-client.csproj $ZIP_DIR/jarvis-csharp-client.csproj
cp jarvis-csharp-client.sln $ZIP_DIR/jarvis-csharp-client.sln
cp Program.cs $ZIP_DIR/Program.cs
cp setup.sh $ZIP_DIR/setup.sh

#Copy the client directories
cp -R bin $ZIP_DIR/bin
cp -R obj $ZIP_DIR/obj
cp -R pb $ZIP_DIR/pb

# zip the client up
zip -r jarvis-client-version_number-csharp.zip jarvis-csharp-client