---
title: "How to compile the leaked CS:GO source code leak. This apparently works."
source: "https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/"
author:
  - "[[John Cartwright]]"
published: 2022-10-27
created: 2025-05-04
description: "How to compile the leaked CS:GO source code leak on Windows."
tags:
  - "clippings"
---
[

# Securitron Linux blog.

](https://www.securitronlinux.com/)

Server load: 0

 

Server time: Monday 05 May 2025. 02:33:20 AM – UTC.

## How to compile the leaked CS:GO source code leak. This apparently works.

Post by John Cartwright. Posted on April 25, 2020, this was 5 years ago. Post ID: 14269. Page [permalink](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/).  
  
WordPress uses cookies, or tiny pieces of information stored on your computer, to verify who you are. There are cookies for logged in users and for commenters.  
These cookies expire two weeks after they are set.

  
  
[Tweet](https://twitter.com/intent/tweet)  
  

1\. Install Visual Studio Community 2015 on Windows 10 64-bit

2\. Create the solution with CreateSolution.bat

3\. Replace any `#include "**../../src/public/vgui_controls/Controls.h**"` with `#include "**../../public/vgui_controls/Controls.h**"`

4a. Copy cryptlib.lib from `**hl2_src\lib\common\win32\2015\release\cryptlib.lib to cstrike15_src\lib\win32\2015\release\**` (create the folders as neccessary)

4b. Copy `**hl2_src\lib\public\libcef.lib**` into `**cstrike15_src\lib\win32\release\libcef.lib**`

Apply the fixes: \`**git am < basic\_fixes.patch**\`

| From 6f22ce66fd030e6edeff3f29e8286958d669fbc5 Mon Sep 17 00:00:00 2001 From: Anon302 &lt;anongitlab302@protonmail.com&gt; Date: Sat, 25 Apr 2020 03:40:09 +0200 Subject: \[PATCH\] Fixes   \---  dx9sdk/include/ks.h                       \| 2 +-  game/shared/baseachievement.cpp           \| 2 +-  game/shared/cstrike15/achievements\_cs.cpp \| 2 +-  3 files changed, 3 insertions(+), 3 deletions(\-)   diff \--git a/dx9sdk/include/ks.h b/dx9sdk/include/ks.h index 4f766b9..740c8ac 100644 \--- a/dx9sdk/include/ks.h +++ b/dx9sdk/include/ks.h @@ -35,7 +35,7 @@ Abstract:  #endif // !defined(SIZEOF\_ARRAY)    #if defined(\_\_cplusplus) &amp;&amp; \_MSC\_VER &gt;= 1100 \-#define DEFINE\_GUIDSTRUCT(g, n) struct \_\_declspec(uuid(g)) n +#define DEFINE\_GUIDSTRUCT(g, n)  #define DEFINE\_GUIDNAMED(n) \_\_uuidof(struct n)  #else // !defined(\_\_cplusplus)  #define DEFINE\_GUIDSTRUCT(g, n) DEFINE\_GUIDEX(n) diff \--git a/game/shared/baseachievement.cpp b/game/shared/baseachievement.cpp index 1b0abf7..50a7af5 100644 \--- a/game/shared/baseachievement.cpp +++ b/game/shared/baseachievement.cpp @@ -17,7 +17,7 @@  #endif // CLIENT\_DLL    #include &lt;vgui/ISystem.h&gt; \-#include "../../src/public/vgui\_controls/Controls.h" +#include "../../public/vgui\_controls/Controls.h"    // NOTE: This has to be the last file included!  #include "tier0/memdbgon.h" diff \--git a/game/shared/cstrike15/achievements\_cs.cpp b/game/shared/cstrike15/achievements\_cs.cpp index 45c69c7..6ddf0cc 100644 \--- a/game/shared/cstrike15/achievements\_cs.cpp +++ b/game/shared/cstrike15/achievements\_cs.cpp @@ -39,7 +39,7 @@ IAchievementMgr \* CAchievementMgr::GetInstanceInterface()    // \[dwenger\] Necessary for sorting achievements by award time  #include &lt;vgui/ISystem.h&gt; \-#include "../../src/public/vgui\_controls/Controls.h" +#include "../../public/vgui\_controls/Controls.h"    #endif // CLIENT\_DLL   \--  2.21.0.windows.1 |
| --- | --- | --- | --- |

5\. Build Solution in Visual Studio

6\. Download Depots with [https://github.com/SteamRE/DepotDownloader](https://github.com/SteamRE/DepotDownloader)[https://github.com/SteamRE/DepotDownloader](https://github.com/SteamRE/DepotDownloader).

| dotnet %~dp0DepotDownloader.dll %\* \-app 730 \-depot 731 \-manifest 7043469183016184477 \-username STEAMUSERNAME \-password PASSWORD dotnet %~dp0DepotDownloader.dll %\* \-app 730 \-depot 732 \-manifest 4047004309608881181 \-username STEAMUSERNAME \-password PASSWORD |
| --- |

7\. Copy the depot contents into the game folder (one folder up from cstrike15\_src). Replace all files.

8\. Steam needs to be open with a CS:GO account, then just double click csgo.exe and it should launch in insecure mode.

There appears to be a lot of weapon code in game\\shared\\cstrike15\\weapon\_cbase.cpp and \\game\\shared\\cstrike15\\cs\_weapon\_parse.cpp

If you search all files for “recoil” you’ll find quite a lot, so at least parts of the code are there. My current (very early) theory is that some files are missing containing the recoil information for the weapons. If that is the case, those would only need to be added by downloading more depots or from a CS:GO install directory. That’s very much a theory and might be completely wrong though.

Categories: [Battlefield](https://www.securitronlinux.com/category/battlefield/)

Tags: [build](https://www.securitronlinux.com/tag/build/), [code](https://www.securitronlinux.com/tag/code/), [csgo](https://www.securitronlinux.com/tag/csgo/), [instructions](https://www.securitronlinux.com/tag/instructions/), [leaked](https://www.securitronlinux.com/tag/leaked/), [valve](https://www.securitronlinux.com/tag/valve/)

### 9 responses to “How to compile the leaked CS:GO source code leak. This apparently works.”

1. ![](https://secure.gravatar.com/avatar/ce637e2d6f8aaab13b857f074d2561fdb23520e103b9e22b26589ecda1b56a38?s=32&d=robohash&r=pg) **CSGO lover** says:
	[October 27, 2022 at 8:26 PM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-11465)
	Couldn’t Start Offline match with bot, when click no UI appear.
2. ![](https://secure.gravatar.com/avatar/967d5a5e233040e64dd2dea53012a8ce3b0b30dc15a68c5e3f798969a53ef5f5?s=32&d=robohash&r=pg) **SmileyAG** says:
	[June 23, 2021 at 3:18 AM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-9941)
	Hello, I want to say thanks for your guide.
	Answering the question why there is no recoil for the weapons, I can say that the code has been removed for the partner depot.
	I found one Linux community fork, which supports “cstrike15\_src” and they were able to add recoil code back with the help of reverse-engineering tools (IDA e.g.), [https://github.com/SwagSoftware/Kisak-Strike](https://github.com/SwagSoftware/Kisak-Strike)
	btw I got myself settings up GitHub Actions CI for “cstrike15\_src”, it took me a few days, that means DLLs can be built automatically with new code changes, if you are interested you can take a look at my fork: [https://github.com/SmileyAG/cstrike15\_src-CI/commits/fixes-from-kisak-strike](https://github.com/SmileyAG/cstrike15_src-CI/commits/fixes-from-kisak-strike)
3. ![](https://secure.gravatar.com/avatar/8224737b5cba56c2955dd05398cd330694312748b1fdaa2322c0027222cef11f?s=32&d=robohash&r=pg) **VorteX** says:
	[January 11, 2021 at 8:33 AM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-9240)
	Can Some of you guys actually make a step by step on how to add the fixes ??? Or even the full thing Please
4. ![](https://secure.gravatar.com/avatar/5dee7a94d93f1a4595d331ed2d78fcac375dcc88121f856d41f297539419a630?s=32&d=robohash&r=pg) **Diep Do Tien** says:
	[July 8, 2020 at 1:09 AM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-8435)
	Hello  
	I’ve just compiled all the files… but got error msg:  
	—————————  
	Engine Error  
	—————————  
	Unable to load version from steam.inf  
	—————————  
	OK  
	—————————  
	How to deal with this??  
	Thanks
5. ![](https://secure.gravatar.com/avatar/eee91c8669a70099e1898d5b934cfa3f5caa388e2186cdd70e9585908fea119b?s=32&d=robohash&r=pg) **undevdecatos** says:
	[May 12, 2020 at 12:50 AM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-8307)
	can you do a guide on how to compile the leaked half life 2 on Linux?
6. ![](https://secure.gravatar.com/avatar/e0497e15baab2fc1e8f27cd8058ce66d90a1cda59b82eb06dfb83c52beb9b5c1?s=32&d=robohash&r=pg) **Margen67** says:
	[May 11, 2020 at 11:32 AM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-8306)
	Have you gotten TF2 from the same leak to build?
7. ![](https://secure.gravatar.com/avatar/e2e66e7808d0ba150e6e4135de43deada14017f6216a2844e37bb3ed9a5e62f0?s=32&d=robohash&r=pg) **rrcbean** says:
	[May 5, 2020 at 4:42 PM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-8297)
	The .patch refuses to apply? Also what way do I combine 731 + 732, and (731 + 732) with the build?
8. ![](https://secure.gravatar.com/avatar/e2238439323d5e1d484b80253405fe7cf652c8370d3178f99806f84f2eb362f4?s=32&d=robohash&r=pg) **DTstil** says:
	[May 2, 2020 at 8:17 AM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-8291)
	how to apply .patch?
	- ![](https://secure.gravatar.com/avatar/5bdbc0b934cc991538021fa6c63d8f8ac37e4eb98ba65441c5a57f24b6ba0040?s=32&d=robohash&r=pg) **[John Cartwright](https://www.securitronlinux.com/)** says:
		[May 2, 2020 at 10:30 AM](https://www.securitronlinux.com/battlefield/how-to-compile-the-leaked-csgo-source-code-leak-this-apparently-works/#comment-8292)
		Use git am. Here is the documentation: [https://git-scm.com/docs/git-am](https://git-scm.com/docs/git-am)

\-|- [Contact me](https://securitronlinux.com/contact-me/). -|- [Official](https://doomwiki.org/wiki/Entryway) Doom WIKI.

Stalker 2 news and [information page](https://securitronlinux.com/stalker2-news-information-site/index.php).

## Meta

- [Log in](https://www.securitronlinux.com/wp-login.php)
- [Entries feed](https://www.securitronlinux.com/feed/)
- [Comments feed](https://www.securitronlinux.com/comments/feed/)
- [WordPress.org](https://wordpress.org/)

1. ![](https://secure.gravatar.com/avatar/1aec7c9fc2d691ef1859ff498946f3afc1fc69775e4a670507fec30bd22036e4?s=48&d=robohash&r=pg)
	[Humza](https://github.com/humzak711) on [New rootkit in the wild, this is targeting Arch Linux and will be released on GitHub soon.](https://www.securitronlinux.com/arch-linux/new-rootkit-in-the-wild-this-is-targeting-arch-linux-and-will-be-released-on-github-soon/#comment-17927)October 4, 2024
	Hi, I am humza i'm the author of this rootkit, you can check out my github https://github.com/humzak711, it will be…
2. ![](https://secure.gravatar.com/avatar/3a55fe745e544b037f1a4878ba8fe0531249884b3d619c7711e1177229cf28ba?s=48&d=robohash&r=pg)
	hamid mazuji on [How to crack an Ubuntu user password easily with John The Ripper.](https://www.securitronlinux.com/debian-testing/how-to-crack-an-ubuntu-user-password-easily-with-john-the-ripper/#comment-17572)September 14, 2024
	this article presupposes that we already have the user password; the first step: jason@jason-desktop:~/Documents/Windows$ sudo apt install john will challenge…
3. ![](https://secure.gravatar.com/avatar/5bdbc0b934cc991538021fa6c63d8f8ac37e4eb98ba65441c5a57f24b6ba0040?s=48&d=robohash&r=pg)
	[John Cartwright](https://securitronlinux.com/) on [An all-new Stalker game engine has surfaced. This is the IX-Ray platform.](https://www.securitronlinux.com/stalker/an-all-new-stalker-game-engine-has-surfaced-this-is-the-ix-ray-platform/#comment-16893)July 26, 2024
	This is a cool game.
4. ![](https://secure.gravatar.com/avatar/42751723aa6aa7b83e099b00b8e697f49b49e59a6bdd9e25534309c6a0be5368?s=48&d=robohash&r=pg)
	John C on [How to crack a wireless WPA2 network with aircrack on Parrot or Kali Linux.](https://www.securitronlinux.com/debian-testing/how-to-crack-a-wireless-wpa2-network-with-aircrack-on-parrot-or-kali-linux/#comment-16798)July 19, 2024
	Just trying to learn wifi security
5. ![](https://secure.gravatar.com/avatar/bec33e4e675e859b8b08c5db21886fe07fb4f6da5b920dd8f8c74c42a026364f?s=48&d=robohash&r=pg)
	[ChatGPT Online](https://gptdeutsch.com/) on [How to enable Developer mode in ChatGPT and get better prompt results.](https://www.securitronlinux.com/product/how-to-enable-developer-mode-in-chatgpt-and-get-better-prompt-results/#comment-15768)May 10, 2024
	Great tutorial on enabling developer mode in ChatGPT! I appreciate the detailed instructions provided. This has really helped me improve…

Radio and television streams: [Australian radio and TV streams.](https://securitronlinux.com/radio-television-streams/)  
Daily Mail videos gallery: [Daily Mail videos gallery.](https://www.securitronlinux.com/dailymail-videos-page/)  
Another look at the [NEXTSTEP code](https://www.securitronlinux.com/bejiitaswrath/another-look-at-the-nextstep-source-code/).

<table><caption>May 2025</caption><thead><tr><th scope="col">M</th><th scope="col">T</th><th scope="col">W</th><th scope="col">T</th><th scope="col">F</th><th scope="col">S</th><th scope="col">S</th></tr></thead><tbody><tr><td colspan="3">&nbsp;</td><td>1</td><td><a href="https://www.securitronlinux.com/2025/05/02/">2</a></td><td>3</td><td><a href="https://www.securitronlinux.com/2025/05/04/">4</a></td></tr><tr><td><a href="https://www.securitronlinux.com/2025/05/05/">5</a></td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td></tr><tr><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td></tr><tr><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td></tr><tr><td>26</td><td>27</td><td>28</td><td>29</td><td>30</td><td>31</td><td colspan="1">&nbsp;</td></tr></tbody></table>

[« Apr](https://www.securitronlinux.com/2025/04/)    

- [Another very useful Google Dork to find information about the PHP scripts on the website.](https://www.securitronlinux.com/bejiitaswrath/another-very-useful-google-dork-to-find-information-about-the-php-scripts-on-the-website/)
- [How to get ds-da Doom running on Linux very easily. This is not too hard at all.](https://www.securitronlinux.com/battlefield/how-to-get-ds-da-doom-running-on-linux-very-easily-this-is-not-too-hard-at-all/)
- [Installing and using Metasploit framework on Ubuntu to scan a website for vulnerabilities.](https://www.securitronlinux.com/bejiitaswrath/installing-and-using-metasploit-framework-on-ubuntu-to-scan-a-website-for-vulnerabilities/)
- [A Cloudflare feature to be aware of when running a website in 2025.](https://www.securitronlinux.com/bejiitaswrath/a-cloudflare-feature-to-be-aware-of-when-running-a-website-in-2025/)
- [4chan wordfilters and some other miscellaneous code.](https://www.securitronlinux.com/bejiitaswrath/4chan-wordfilters-and-some-other-miscellaneous-code/)

## Pages.

© 2025 Securitron Linux blog.. All rights reserved.  

[![RSS Feed.](https://www.securitronlinux.com/themes/rss.webp)](https://www.securitronlinux.com/feed/)

[Follow @bejiitas\_wrath](https://twitter.com/bejiitas_wrath?ref_src=twsrc%5Etfw)

Recent posts.

[Another very useful Google Dork to find information about the PHP scripts on the website.](https://www.securitronlinux.com/bejiitaswrath/another-very-useful-google-dork-to-find-information-about-the-php-scripts-on-the-website/)  
[How to get ds-da Doom running on Linux very easily. This is not too hard at all.](https://www.securitronlinux.com/battlefield/how-to-get-ds-da-doom-running-on-linux-very-easily-this-is-not-too-hard-at-all/)  
[Installing and using Metasploit framework on Ubuntu to scan a website for vulnerabilities.](https://www.securitronlinux.com/bejiitaswrath/installing-and-using-metasploit-framework-on-ubuntu-to-scan-a-website-for-vulnerabilities/)  
[A Cloudflare feature to be aware of when running a website in 2025.](https://www.securitronlinux.com/bejiitaswrath/a-cloudflare-feature-to-be-aware-of-when-running-a-website-in-2025/)  
[4chan wordfilters and some other miscellaneous code.](https://www.securitronlinux.com/bejiitaswrath/4chan-wordfilters-and-some-other-miscellaneous-code/)  
  
  

Simple Dark website theme.

[Contact page](https://www.securitronlinux.com/contact-me/).

[Radio and Television streams](https://securitronlinux.com/radio-television-streams/).

[DailyMail videos page](https://securitronlinux.com/dailymail-videos-page/).

[Cryptocurrency prices monitor](https://www.securitronlinux.com/cryptocurrency-bitcoin-prices/).

[Online m3u8 stream player](https://securitronlinux.com/tv/).

  
Uptime: 159:19:31: 0
