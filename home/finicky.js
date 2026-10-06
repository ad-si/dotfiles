export default {
  defaultBrowser: "Brave Browser",
  rewrite: [],
  handlers: [
    {
      match: (url) =>
        url.hostname === "lobste.rs" || url.hostname.endsWith(".lobste.rs"),
      browser: "Firefox",
    },
    {
      match: (url) =>
        url.hostname === "news.ycombinator.com" ||
        url.hostname === "f5bot.com" ||
        url.hostname.endsWith(".f5bot.com"),
      browser: {
        name: "Brave Browser",
        profile: "Adrian Sieber",
      },
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
