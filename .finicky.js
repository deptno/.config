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
      match: /^http:\/\/localhost:8457.*$/,
      browser: "Min",
    },
    {
      match: /^http:\/\/localhost:8888.*$/,
      browser: "Min",
    },
    { // jupyter notebook
      match: /^http:\/\/localhost:8889/,
      browser: "Min",
    },
    { // stable-diffusion-web-ui
      match: /^http:\/\/127.0.0.1:7860/,
      browser: "Min",
    },
    { // comfyui
      match: /^http:\/\/127.0.0.1:8188/,
      browser: "Min",
    },
    {
      match: /^http:\/\/localhost/,
      browser: "Google Chrome",
    },
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
