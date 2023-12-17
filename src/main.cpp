#include <iostream>

#include "App.h"

int main() {
  int port = 3000;

  uWS::App()
      .get("/",
           [](uWS::HttpResponse<false>* res, uWS::HttpRequest* req) {
             std::cout << "Serving " << req->getUrl() << std::endl;
             res->writeStatus(uWS::HTTP_200_OK);
             res->writeHeader("Content-Type", "text/html; charset=utf-8");
             res->tryEnd("Hello, World!");
           })
      .listen(port,
              [port](auto* token) {
                if (token)
                  std::cout << "Serving over HTTP at " << port << std::endl;
              })
      .run();

  return 0;
}
