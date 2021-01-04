package com.example.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;


@SpringBootTest(webEnvironment=WebEnvironment.RANDOM_PORT)
class DemoApplicationTests {
  @LocalServerPort
  private int port;

  @Autowired
  private TestRestTemplate restTemplate;

  @Test
  void contextLoads() {
    String url = "http://localhost:" + port + "/api/booking/status/5";
    String result = "{\"parkingId\":1,\"vehicleId\":1,\"ts_from\":\"2021-01-04T13:34:05.255+00:00\",\"ts_till\":\"2021-01-04T13:35:05.255+00:00\",\"cost\":40,\"payment\":false}";

    assertThat(this.restTemplate.getForObject(url,
      String.class)).contains(result);
  }
}
