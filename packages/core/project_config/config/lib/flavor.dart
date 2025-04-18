enum Flavor {
  dev,
  prod,
  // test,
  // staging,
  // local,
  // release,
  // debug,
  // beta,
  // alpha,
  // canary,
  // nightly,
  // experimental,
  // preview,
  // snapshot,
  // rc, // Release Candidate
  // mvp, // Minimum Viable Product
  // lts, // Long Term Support
}

class FlavorConfig {
  static Flavor? flavor;
}
