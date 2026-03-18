#!/bin/sh
#    Proprietary and Confidential
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#    This source code is the property of:
#
#     Robert Krimper (c) 2026
#
#     https://www.krimper.com
#
#    Author:         Robert Krimper, https://www.linkedin.com/in/robert-krimper
#    Modified by:    
#    Module:         generate.sh
#    Description:    Generates the C# API files from the proto files, these are needed for the C# gRPC client
#

PROTO_DIR=proto
PROTO_REF_DIR=proto-ref
GOOGLE_PROTO_DIR=proto-ref/google
API_DIR=pb
CSHARP_PLUGIN=/.nuget/packages/grpc.tools/2.78.0/tools/linux_x64/grpc_csharp_plugin

mkdir $API_DIR

#create the C# proto references for the jarvis api
protoc --plugin=protoc-gen-grpc=$HOME$CSHARP_PLUGIN --csharp_out=./pb --grpc_out=./pb -I $PROTO_DIR -I $GOOGLE_PROTO_DIR $PROTO_DIR/*/**/*.proto


#protoc --plugin=protoc-gen-grpc=<PATH_TO_GRPC_CSHARP_PLUGIN.EXE> --csharp_out=<OUT_DIR> --grpc_out=<OUT_DIR> -I <INCLUDE_DIR> <PROTO_FILE_NAME>.proto

#python3 -m grpc_tools.protoc -I $PROTO_DIR -I $GOOGLE_PROTO_DIR --python_out=. --pyi_out=. --grpc_python_out=. $PROTO_DIR/*/**/*.proto

