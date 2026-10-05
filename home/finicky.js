export default {
  defaultBrowser: "Brave Browser",
  rewrite: [],
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
    {
      match: /worldset/i,
      browser: {
        name: "Brave Browser",
        profile: "Worldset",
      },
    },
  ],
}
