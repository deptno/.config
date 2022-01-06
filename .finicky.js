module.exports = {
  defaultBrowser: "Safari",      
  handlers: [
    {
      match: /zigbang/,
      browser: "Google Chrome"
    },
    {
      match: /^https:\/\/meet\.google\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https:\/\/console\.firebase\.google\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https:\/\/appstoreconnect\.apple\.com.*/,
      browser: "Google Chrome"
    },
    {
      match: /^https:\/\/developer\.apple\.com.*/,
      browser: "Google Chrome"
    }
  ]
}
