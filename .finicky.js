const COMPANY = {
  name: "Google Chrome",
  profile: "Profile 3"
}
const ZEPLIN_FE = {
  name: "Google Chrome",
  profile: "Profile 1"
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
      match: /zigbang/,
      browser: COMPANY,
    },
    {
      match: /^https:\/\/meet\.google\.com\/.*$/,
      browser: COMPANY,
    },
    {
      match: /^https:\/\/docs\.google\.com\/.*$/,
      browser: COMPANY,
    },
    {
      match: /^https:\/\/console\.firebase\.google\.com\/.*$/,
      browser: COMPANY,
    },
    {
      match: /^https:\/\/console\.cloud\.google\.com\/.*$/,
      browser: COMPANY,
    },
    {
      match: /^https:\/\/appstoreconnect\.apple\.com.*/,
      browser: COMPANY,
    },
    {
      match: /^https:\/\/developer\.apple\.com.*/,
      browser: COMPANY,
    },
    {
      match: /^https:\/\/app\.zeplin\.io.*/,
      browser: COMPANY,
    },
    {
      match: /^http:\/\/localhost/,
      browser: COMPANY,
    },
    {
      match: /clickup\.com/,
      browser: COMPANY,
    },
    {
      match: /partners\.ceo/,
      browser: COMPANY,
    },
    {
      match: /appsflyer\.com/,
      browser: COMPANY,
    },
    {
      match: /https:\/\/zpl.io/,
      browser: ZEPLIN_FE,
    },
    {
      match: /https:\/\/www\.figma\.com\/file/,
      browser: COMPANY,
    },
    {
      match: /https:\/\/linter-report/,
      browser: COMPANY,
    },
    {
      match: /https:\/\/app\.datadoghq\.com/,
      browser: COMPANY,
    },
    {
      match: /https:\/\/www\.figma\.com/,
      browser: COMPANY,
    },
    {
      match: ['https://slack.com/oauth/v2/authorize?scope=incoming-webhook&client_id=2154695248.29651499271*'],
      browser: COMPANY,
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
      browser: COMPANY,
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
