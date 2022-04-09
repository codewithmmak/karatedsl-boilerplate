function fn() {
  var env = karate.env; // get system property 'karate.env'
  var os = karate.os;
  karate.log('karate.env system property was:', env);
  karate.log("Your OS Is",os);

  if (!env) {
    env = 'dev';

  }
  var config = {
    env: env,
    baseUrl: 'https://gorest.co.in',
    tokenID: '860e670f820bcaa247f0fe6fb5da9e3c8de411fbbc5f06314a4a7a8e2a0a70d4',
    os : os
  }
  if (env == 'dev') {
    config.baseUrl = 'https://gorest.co.in'
  } else if (env == 'e2e') {
    config.baseUrl = 'https://gorest.co.in';
  }
  return config;
}