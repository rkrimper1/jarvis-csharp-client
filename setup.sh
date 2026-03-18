#!/bin/sh
#   Proprietary and Confidential
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#   This source code is the property of:
#
#     Robert Krimper (c) 2026
#
#     https://www.krimper.com
#
#    Author:         Robert Krimper, https://www.linkedin.com/in/robert-krimper
#    Modified by:    
#    Module:         setup.sh
#    Description:    Sets up the development environment for the C# gRPC client.
#
#

set -euo pipefail

# Install .NET SDK 8.0
sudo apt-get update -q
sudo apt-get install -y dotnet-sdk-8.0

echo "dotnet $(dotnet --version) installed successfully"

# Install VS Code C# Dev Kit extension
code --install-extension ms-dotnettools.csdevkit
echo "C# Dev Kit extension installed successfully"