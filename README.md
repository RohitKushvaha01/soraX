<div align="center">

![Banner](/images/editor_banner.jpg)
----
[![CI](https://github.com/Rosemoe/sora-editor/actions/workflows/gradle.yml/badge.svg?event=push)](https://github.com/Rosemoe/sora-editor/actions/workflows/gradle.yml)
![GitHub License](https://img.shields.io/github/license/Rosemoe/sora-editor?link=https%3A%2F%2Fgithub.com%2FRosemoe%2Fsora-editor%2Fblob%2Fmain%2FLICENSE&link=https%3A%2F%2Fgithub.com%2FRosemoe%2Fsora-editor%2Fblob%2Fmain%2FLICENSE)
[![Maven Central](https://img.shields.io/maven-central/v/io.github.rosemoe/editor.svg?label=Maven%20Central)]((https://search.maven.org/search?q=io.github.rosemoe%20editor))   
[![Telegram](https://img.shields.io/badge/Join-Telegram-blue)](https://t.me/rosemoe_code_editor)
[![QQ](https://img.shields.io/badge/Join-QQ_Group-ff69b4)](https://jq.qq.com/?_wv=1027&k=n68uxQws)

sora-editor is a cool and optimized code editor on Android platform

</div>

Read this in other languages: [English](README.md), [简体中文](README.zh-cn.md), [Español](README.es.md), [日本語](README.jp.md).

Note that statements in other languages may not be up-to-date.

***Work In Progress*** This project is still developing slowly.   

**Issues and pull requests are welcome.**

## Maintaining this fork (Xed-Editor)

`soraX` is a mirror of [Rosemoe/sora-editor](https://github.com/Rosemoe/sora-editor) that is consumed
by [Xed-Editor](https://github.com/Xed-Editor/xed-editor). `main` is **upstream `main` plus a small
number of local commits** (the oniguruma submodule URL fix, this document, and any patches you add).

### How Xed-Editor consumes this repo

No publishing or scripts are involved. Xed-Editor declares dependencies on the **soraX** modules
(`soraX:editor`, `soraX:editor-lsp`, `soraX:language-textmate`, `soraX:oniguruma-native`) in its
version catalog, and its `settings.gradle.kts` uses an **included build** with dependency
substitution:

```kotlin
includeBuild("soraX") {
    dependencySubstitution {
        substitute(module("soraX:editor")).using(project(":editor"))
        substitute(module("soraX:editor-lsp")).using(project(":editor-lsp"))
        substitute(module("soraX:language-textmate")).using(project(":language-textmate"))
        substitute(module("soraX:oniguruma-native")).using(project(":oniguruma-native"))
    }
}
```

The `soraX:*` coordinates are placeholders - they are not published anywhere and are replaced by the
matching project in the `soraX` build. So every Xed-Editor build compiles these modules directly from
the checked-out `soraX` submodule. Whatever commit is checked out in `soraX/` is exactly what gets
built - there is nothing to run, no version to bump, and no cache to worry about.

### Adding a patch

1. Make sure your local commits on top of upstream stay **small and few** so syncs stay easy.
   Prefer touching files that upstream does not rewrite often.
2. Edit the code in the `soraX` checkout and rebuild Xed-Editor to test it — changes take effect
   immediately, no extra step.
3. When it works, commit it on a branch and open a PR back to `main`:

   ```bash
   git checkout main
   git checkout -b my-patch
   # ...edit the editor code...
   git add -A
   git commit -m "patch: describe the change"
   git push -u origin my-patch   # then open/merge a PR on GitHub
   ```

4. Update the `soraX` submodule pointer in Xed-Editor to the new commit and commit that change there.

### Staying synced with upstream

Never re-create `main` from upstream once it contains local commits (`git reset --hard upstream/main`
deletes them). Instead **merge** upstream in:

```bash
git remote add upstream https://github.com/Rosemoe/sora-editor.git   # once
git fetch upstream
git checkout main
git merge upstream/main
```

Because `main` is based on upstream with only a few local commits, this is usually a clean
fast-forward. A conflict can only appear in a file that both you and upstream changed — resolve it by
keeping your patch's intent, commit the merge, and push:

```bash
git push origin main
```

Then update the `soraX` submodule pointer in Xed-Editor so builds use the new commit.

> Note: the AGP version used by this repo must match the one in Xed-Editor's
> `gradle/libs.versions.toml`, because Gradle does not allow two Android Gradle plugin versions in
> one build.

---

## Features

- [x] Incremental syntax highlight
- [x] Auto-completion (with [code snippets](https://macromates.com/manual/en/snippets))
- [x] Auto indent
- [x] Code block lines
- [x] Scale text
- [x] Undo/redo
- [x] Search and replace
- [x] Auto wordwrap
- [x] Show non-printable characters
- [x] Diagnostic markers
- [x] Text magnifier
- [x] Sticky Scroll
- [x] Highlight bracket pairs
- [x] Event System
- [x] TextMate and TreeSitter support

## Documentation

To quickly get started, please view
this [Quickstart Guide](https://project-sora.github.io/sora-editor-docs/guide/getting-started).

To check out all docs, please
visit [Documentation Site](https://project-sora.github.io/sora-editor-docs/).

* [Editor Overview](https://project-sora.github.io/sora-editor-docs/guide/editor-overview)
* [Reference](https://project-sora.github.io/sora-editor-docs/reference/xml-attributes)
* [Documentation Repository](https://github.com/project-sora/sora-editor-docs)

## Screenshots

<div style="overflow: hidden">
<img src="/images/general.jpg" alt="GeneralAppearance" width="40%" align="bottom" />
<img src="/images/auto_completion.jpg" alt="AutoCompletion" width="40%" align="bottom" />
</div>

## Discuss

* Official QQ Group:[734652304](https://qm.qq.com/q/kKBqRsVrQ4)
* Official [Telegram Group](https://t.me/rosemoe_code_editor)

## Contributors

<a href="https://github.com/Rosemoe/sora-editor/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Rosemoe/sora-editor" />
</a>

## License

```
sora-editor - the awesome code editor for Android
https://github.com/Rosemoe/sora-editor
Copyright (C) 2020-2026  Rosemoe

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
USA

Please contact Rosemoe by email 2073412493@qq.com if you need
additional information or have any questions
```

## Acknowledgements

Thanks to [JetBrains](https://www.jetbrains.com/?from=CodeEditor) for allocating free open-source
licences for IDEs such as [IntelliJ IDEA](https://www.jetbrains.com/idea/?from=CodeEditor).   
[<img src=".github/jetbrains-variant-3.png" width="200"/>](https://www.jetbrains.com/?from=CodeEditor)
