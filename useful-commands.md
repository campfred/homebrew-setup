# Useful commands

## Download YouTube video into an MKV file with thumbnail file using browser cookies

```shell
yt-dlp --cookies-from-browser "${base_browser_name}:${browser_profile_path}::${firefox_container_name}" --write-thumbnail --merge-output-format mkv --remux-video mkv ${youtube_url}
```

> [!TIP]
> Use `firefox` for Zen Browser.

> [!NOTE]
> Preset equivalent to `--merge-output-format mkv --remux-video mkv` is `-t mkv`.
