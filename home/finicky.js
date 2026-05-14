export default {
  defaultBrowser: "Brave Browser",
  rewrite: [
    {
      match: "x.com/*",
      url: (url) => {
        url.host = "xcancel.com"
        return url
      },
    },
  ],
  handlers: [
    {
      match: [
        "lobste.rs/*",
        "*.lobste.rs/*",
      ],
      browser: "Firefox",
    },
    {
      match: [
        "*.dropscan.de*",
        "*.mbs.de*",
      ],
      browser: {
        name: "Brave Browser",
        profile: "Feram",
      },
    },
  ],
}
