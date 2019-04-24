var PROTO_PATH = __dirname + '/Library.proto';

var grpc = require('grpc');
var protoLoader = require('@grpc/proto-loader');

var packageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {
        keepCase: true,
        longs: String,
        enums: String,
        defaults: true,
        oneofs: true
    }
);

var library_proto = grpc.loadPackageDefinition(packageDefinition) // .helloworld;

function main() {
  var client = new library_proto.SearchService(
      'localhost:50051',
      grpc.credentials.createInsecure()
  );

  client.search(
      {text: 'the bible'},
      function(err, response) {
          if (!!err) {
              console.log('Err:', err);
          } else {
              console.log(response);
              console.log('Book:', response.book);
          }
      }
  );
}

main();
