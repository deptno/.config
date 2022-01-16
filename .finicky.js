module.exports = {
  defaultBrowser: "Safari",      
  options: {
    logRequests: true,
  },
  handlers: [
    {
      match: /zigbang/,
      browser: "Google Chrome",
    },
    {
      match: /^https:\/\/meet\.google\.com\/.*$/,
      browser: "Google Chrome",
    },
    {
      match: /^https:\/\/docs\.google\.com\/.*$/,
      browser: "Google Chrome",
    },
    {
      match: /^https:\/\/console\.firebase\.google\.com\/.*$/,
      browser: "Google Chrome",
    },
    {
      match: /^https:\/\/appstoreconnect\.apple\.com.*/,
      browser: "Google Chrome",
    },
    {
      match: /^https:\/\/developer\.apple\.com.*/,
      browser: "Google Chrome",
    },
    {
      match: /^https:\/\/app\.zeplin\.io.*/,
      browser: "Google Chrome",
    },
    {
      match: ({ url }) => {
        const queries = getUrlParams(url.search)
        const payload = parseJwt(queries.login_hint)

        if (payload) {
          const { iss } = payload

          if (iss === 'https://slack.com') {
            return payload['https://slack.com/team_id'] === 'T06BALYG5'
          }
        }
        return false
      },
      browser: "Google Chrome",
    },
  ],
}

const parseJwt = (token) => {
  try {
    const payload = token.split('.')[1]
    return JSON.parse(atob(payload));
  } catch (e) {
  }
}
const getUrlParams = (search) => {
  return search
    .split('&')
    .reduce((queries, hash) => {
      const [key, val] = hash.split('=')
      queries[key] = decodeURIComponent(val)
      return queries
    }, {})
}
const atob = (input) => {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
  const str = (String (input)).replace (/[=]+$/, '');

  if (str.length % 4 === 1) {
    throw new InvalidCharacterError ("'atob' failed: The string to be decoded is not correctly encoded.");
  }
  for (
    var bc = 0, bs, buffer, idx = 0, output = '';
    buffer = str.charAt (idx++);
    ~buffer && (bs = bc % 4 ? bs * 64 + buffer : buffer,
      bc++ % 4) ? output += String.fromCharCode (255 & bs >> (-2 * bc & 6)) : 0
  ) {
    buffer = chars.indexOf (buffer);
  }
  return output;
}
