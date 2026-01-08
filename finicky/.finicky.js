const COMPANY = {
  name: "Google Chrome",
  profile: "Profile 3"
}

module.exports = {
  defaultBrowser: "Safari",
  options: {
    logRequests: true,
  },
  handlers: [
    {
      match: /^file:\/\/\/.*$/,
      browser: "Min",
    },
    {
      match: /^http:\/\/localhost.*$/,
      browser: "Min",
    },
    // {
    //   match: /^http:\/\/localhost/,
    //   browser: "Google Chrome",
    // },
    {
      match: /clickup\.com/,
      browser: COMPANY,
    },
    {
      match: /partners\.ceo/,
      browser: COMPANY,
    },
  ],
}
