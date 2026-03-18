// #    Proprietary and Confidential
// #
// #    This source code is the property of:
// #
// #     Robert Krimper (c) 2026
// #
// #     https://www.krimper.com
// #
// #    Author:         Robert Krimper, https://www.linkedin.com/in/robert-krimper
// #    Modified by:    
// #    Module:         Program.cs
// #    Description:    A simple C# gRPC client that authenticates with the Jarvis 
// #                    server and sends a message using generated gRPC client code 
// #                    from the .proto files. This serves as a reference implementation 
// #                    for how to interact with the Jarvis server using gRPC in C#.
// #
// #

using Grpc.Net.Client;
using Grpc.Core;
using Jarvis.Security;
using Jarvis.Common;
using Jarvis.Business;
using System.Net.Security;

// Allow unencrypted HTTP/2 for local connections
AppContext.SetSwitch("System.Net.Http.SocketsHttpHandler.Http2UnencryptedSupport", true);

// Create a channel to the Jarvis server
using var channel = GrpcChannel.ForAddress("http://localhost:50051");
var client = new SecurityService.SecurityServiceClient(channel);

// Build the request
var request = new AuthenticateRequest
{
    Meta = new RequestMeta
    {
        RequestId = Guid.NewGuid().ToString(),
        UserId = "user-123",
        SessionId = "session-abc",
        Source = "jarvis-csharp-client"
    },
    SubjectId = "tony-stark",
    Method = AuthMethod.Token
};

// Call Authenticate
var response = await client.AuthenticateAsync(request);

Console.WriteLine($"Authenticated: {response.Authenticated}");
Console.WriteLine($"Access Token:  {response.AccessToken}");
Console.WriteLine($"Granted Scopes: {string.Join(", ", response.GrantedScopes)}");
Console.WriteLine($"Expires At: {response.ExpiresAt}");

// Send a message using the access token for authorization
var headers = new Metadata
{
    { "Authorization", $"Bearer {response.AccessToken}" }
};

var businessClient = new BusinessOpsService.BusinessOpsServiceClient(channel);
var sendMessageRequest = new SendMessageRequest
{
    Meta = new RequestMeta
    {
        RequestId = Guid.NewGuid().ToString(),
        UserId = "user-123",
        SessionId = "session-abc",
        Source = "jarvis-csharp-client"
    },
    Recipients = { "rob@krimper.com" },
    Channel = MessageChannel.Secure,
    Subject = "Urgent: Board meeting rescheduled",
    Body = "Please move the Q4 review to 1400 tomorrow.",
    Encrypt = true 
};

var sendMessageResponse = await businessClient.SendMessageAsync(sendMessageRequest, headers);

Console.WriteLine($"Message ID: {sendMessageResponse.MessageId}");
Console.WriteLine($"Delivered To: {string.Join(", ", sendMessageResponse.DeliveredTo)}");
