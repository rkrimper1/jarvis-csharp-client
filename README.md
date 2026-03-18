# Jarvis API gRPC Client C# Example

This example shows how to call the Jarvis API using C#. The Jarvis API is generated from the proto files

The code demonstrates a simple authenticate and business message call to your local environment.

## Technical Information

## Prerequisites
dotnet-sdk-8.0 > 

## How to run the generator
Make sure you are on an Ubuntu environment, such as a vagrant VM, as described in the jarvis setup guide. Run the setup.sh to install the .Net SDK and the VS Code C# Dev Kit extension, if needed:

```
$ ./setup.sh
```

Once the required C# essentials are setup, you can run the code generator by simply executing make:

```
make
```
NOTE: The generator expects that you have already checked out a fresh copy of jarvis alongside jarvis-csharp-client, Note that prep_protos.sh requires that you install our protoc-gen-stripper plugin.

## References
