package org.openxsp;
import org.openxsp.java.Verticle;
import org.vertx.java.core.Handler;
import org.vertx.java.core.http.HttpServerRequest;


public class DefaultVerticle extends Verticle{

	
	@Override
	public void start() {
		super.start();
		vertx.createHttpServer().requestHandler(new Handler<HttpServerRequest>() {
			@Override
			public void handle(HttpServerRequest httpServerRequest) {
				httpServerRequest.response().setChunked(true);
				httpServerRequest.response().write("<html><head><title>Hello</title></head><body>Hello World</body></html>").end();

			}
		}).listen(7777);


	}
}
