# Considerations on the implementation

Following the principle of Open Close, all the keys and configuration constants
are stored in a Environment variables, with the help of the dotenv gem we can
store all the environment variables for deployment in a simple .env file

The endpoint has been declared on a Restful way by versioning the api, and also
nesting the route on a expressive way, as 

Following the principle of single responsibility, the call to the external api
is implemented on a library file, so this can only be responsibile of making
the requests to the external api, when the application scale in a future
we can extract this integration on a library, besides if we decide to change of
provider we can easily update the integration.

As well the responsible of calling the external library is a service which is
also in charge of flagging any problem and return it to the controller.

The tests follow the principle of avoiding duplicity and test specifically the
requests from the point of the final user, also follow the Four-Phase Patterns:
1. Setup
2. Exercise
3. Verify
4. Teardown this with the help of database cleaner.

Also uses the help of VCR to test the integration with the third party api call,
recording the latest interaction with the http provider, to make the tests run
faster, deterministic and accurated.

