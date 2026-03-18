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
#    Module:         create_csproj.sh
#    Description:    Create C# console project, this is example code to create a C# console project, 
#                    install the necessary NuGet packages, and set up the project structure
#                    for the gRPC client. You can modify this script as needed to 
#                    
#


# fit your specific requirements. 
dotnet new console -n jarvis-csharp-client --output . --force

# Install Grpc.Tools NuGet package
dotnet add package Grpc.Tools
echo "Grpc.Tools installed successfully"

# Install Grpc.Net.Client NuGet package
dotnet add package Grpc.Net.Client
echo "Grpc.Net.Client installed successfully"

# Install Google.Protobuf NuGet package
dotnet add package Google.Protobuf
echo "Google.Protobuf installed successfully"