# Renga builds

Test images of [Renga](https://github.com/Techniix/haiku) (branch `ce/main`), published as
[Releases](../../releases).

## Downloading a build

Open [Releases](../../releases) and download the `.iso` and its `.sha256`. Check it before
writing it to a USB stick:

- Haiku, Renga, Linux: `sha256sum -c <file>.iso.sha256`
- macOS: `shasum -a 256 -c <file>.iso.sha256`
- Windows (PowerShell): `Get-FileHash <file>.iso -Algorithm SHA256`, then compare with the
  `.sha256` file

The images are anyboot images: they boot from a USB stick or optical media on BIOS and UEFI
machines and can be installed from the live desktop.

## How builds get here

GitHub accepts files of at most 100 MB in a repository, so each image is pushed to its own
branch, `build/<name>`, split into parts, with:

- `build.txt`: the image name, the release title, the Renga commit it was built from and the
  release notes;
- `<iso>.sha256`: the checksum of the whole image;
- `parts/<iso>.partNNN`: the parts.

To publish one, open **Actions → Publish build → Run workflow**, enter the build name (the
part after `build/`) and run it. The workflow joins the parts, verifies the checksum and
creates a pre-release named `renga-<name>` with the image as its download; by default it then
deletes the build branch, since the release keeps its own copy.

`tools/join.sh` does the same joining and checking on a local clone of a build branch.
