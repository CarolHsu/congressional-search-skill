# Congressional Advocacy Skill｜國會倡議策略 Skill

[中文](#中文) ｜ [English](#english)

---

<a id="中文"></a>
## 中文

### 這是什麼？

這是一個可以「安裝」到 AI 助理（Claude、Codex 等）裡的功能包，叫做 **Skill（技能）**。裝好之後，你只要告訴 AI「我要拜訪某位議員」，它就會自動幫你：

1. 查這位議員的委員會、背景、台灣／中國相關投票與提案紀錄
2. 逐一檢查今年所有倡議法案在國會的**最新**進度（不是只相信手上的資料）
3. 挑出最適合跟這位議員談的 **3 個議題**
4. 為每個議題擬好具體的請求（例如「請成為共同提案人」）
5. 產出談話重點、可能被問的問題、會議流程、會後追蹤表

它是為 FAPA National Advocacy Conference 這類國會山莊拜會設計的，**每年的倡議法案不同，所以每次使用都要附上當年的「政策資料」**（見下方）。

### 使用前你需要準備

| 項目 | 必要？ | 說明 |
|---|---|---|
| 議員姓名 | 必要 | 例如 Rep. Mark DeSaulnier |
| 當年的政策資料（Legislative Packet） | 必要 | PDF、Word、文字檔都可以。每年法案不同，請用當年版本 |
| 會議 FAQ | 選填 | 用來回答「可能被問的問題」 |
| 開會對象 | 選填 | **助理（預設）** 或 **議員本人**。大多數時候是助理 |
| 代表團成員背景 | 選填 | 例如誰住在哪個選區、在哪家公司工作，用來找共同話題 |
| 開會日期 | 選填 | 用來產生「開會當天早上要再確認的清單」 |

> 重要：AI 必須能**上網**才能查國會最新資料。請確認你使用的 AI 有開啟網路搜尋（Web search）功能。

---

### 安裝教學

先選你用的 AI 工具，照著做即可。**不會寫程式也沒關係，下面都是點選或複製貼上。**

#### 步驟 0：下載這個專案（所有工具都要先做）

1. 在本頁面右上角綠色按鈕 **Code** → 點 **Download ZIP**
2. 下載後解壓縮，你會得到一個資料夾 `congressional-search-skill-main`

#### A. Claude Desktop 桌面版 / claude.ai 網頁版（最簡單）

需要付費方案（Pro / Max / Team / Enterprise），並開啟「程式碼執行」功能。畫面名稱可能隨版本略有不同。

1. 用資料夾裡的 `dist/congressional-advocacy.zip`（**不要解壓縮它**）
2. 開啟 Claude → 左下角頭像 → **Settings（設定）** → **Capabilities（功能）**
3. 確認 **Code execution / 程式碼執行** 已開啟，找到 **Skills** 區塊
4. 點 **Upload skill / 上傳技能**，選 `congressional-advocacy.zip`
5. 把 `congressional-advocacy` 的開關打開
6. 開一個新對話，同時確認有開啟 **Web search（網路搜尋）**

#### B. Claude Code（終端機版 / VS Code / Desktop 內的 Code 分頁）

1. 打開終端機（Mac：Spotlight 搜尋「Terminal」）
2. 進入解壓縮後的資料夾，例如：
   ```bash
   cd ~/Downloads/congressional-search-skill-main
   ```
3. 執行安裝指令：
   ```bash
   ./install.sh claude
   ```
4. 重新啟動 Claude Code。輸入 `/congressional-advocacy` 就能使用

> 不想用指令？手動把 `skills/congressional-advocacy` 整個資料夾複製到 `~/.claude/skills/` 即可。（Mac 按 Cmd+Shift+G 可輸入這個路徑前往；資料夾若不存在就自己建立。）

#### C. Codex（OpenAI Codex CLI / App / IDE 外掛）

1. 同上，進入解壓縮後的資料夾
2. 執行：
   ```bash
   ./install.sh codex
   ```
3. 重新啟動 Codex。輸入 `$congressional-advocacy` 或直接描述需求即可

> 手動安裝：把 `skills/congressional-advocacy` 資料夾複製到 `~/.codex/skills/`。
> 想同時裝在 Claude Code 和 Codex：執行 `./install.sh`（不加任何字）。

#### D. 其他 AI 工具（ChatGPT、Gemini、Cursor、Copilot…）

如果工具支援「Agent Skills / SKILL.md」，把 `skills/congressional-advocacy` 資料夾放到該工具指定的 skills 資料夾即可。

如果不支援，用**貼上 prompt**的方式也能達到八成效果：

1. 開新對話，開啟網路搜尋
2. 把 `skills/congressional-advocacy/SKILL.md` 的內容整份貼進去（若可上傳檔案，連同 `references/` 裡的三個檔案一起上傳）
3. 接著上傳政策資料，並告訴它議員姓名

---

### 怎麼用

安裝後，開新對話，直接用白話文講。範例：

**範例 1：基本用法（預設跟助理開會）**
```
幫我準備拜訪 Rep. Mark DeSaulnier 的會議資料。
政策資料我上傳了（今年的 Legislative Packet 和 FAQ）。
```

**範例 2：跟議員本人開會，並提供代表團背景**
```
幫我準備拜訪 Sen. Alex Padilla 的資料，這次是跟議員本人見面。
政策資料：packets/2026/senate-packet.pdf
代表團：Amy 住在 Los Angeles，在 USC 工作；Kevin 在半導體公司上班。
開會日期：2026-11-05
```

**在 Claude Code / Codex 裡**可以直接給檔案路徑，也可以先輸入 `/congressional-advocacy`（Claude Code）或 `$congressional-advocacy`（Codex）。

### 「助理」與「議員本人」模式的差別

| | 助理模式（預設） | 議員本人模式 |
|---|---|---|
| 破冰 | 不花力氣閒聊，只用一句真實的選民／在地連結說明來意 | 完整的個人／選區／專業共通點策略 |
| 請求（CTA） | 寫成助理可以帶回去報告的版本，附聯絡方式與期限 | 直接對議員提出 |
| 會議節奏 | 先講請求，留較多時間問流程 | 保留寒暄與討論時間 |
| 追蹤 | 助理說「會建議議員」記為 LEAN YES，不算承諾 | 議員親口承諾可記為 YES |

### 每年更新政策資料

這個 skill **沒有內建任何一年的法案**。每年請：

1. 照 [`policy-packet-template.md`](skills/congressional-advocacy/references/policy-packet-template.md) 的格式整理當年法案（或直接使用組織發的 PDF／Word）
2. 每次使用時把檔案一起附上
3. AI 會自己去 Congress.gov 重新確認進度，如果資料與你的版本不同，會明確告訴你

### 常見問題

- **AI 說查不到資料？** 確認網路搜尋已開啟。
- **結果裡有「NEEDS RECHECK」？** 代表這項資訊會變動或無法確認，請開會前一天早上自己點連結再看一次（特別是共同提案人名單）。
- **可以完全相信嗎？** 不行。AI 會附上來源連結，請務必點開核對重要事實後再開會。
- **更新 skill 後怎麼辦？** 重新下載專案，再執行一次安裝（Claude Desktop 則重新上傳 zip）。

---

<a id="english"></a>
## English

### What is this?

A **Skill**: an add-on you install into an AI assistant (Claude, Codex, etc.). Once installed, you tell the AI "I'm meeting with Rep. X" and it will:

1. Research the member's committees, background, and Taiwan/China voting and sponsorship record
2. Check the **current** congressional status of every one of this year's advocacy bills (not just trust your packet)
3. Pick the best **3 issues** to raise with this particular member
4. Draft a concrete ask for each (e.g. "please cosponsor H.R. XXXX")
5. Produce talking points, likely objections, a meeting plan, and a follow-up tracker

It was built for Capitol Hill advocacy meetings such as the FAPA National Advocacy Conference. **Priority bills change every year, so you must supply that year's policy materials each time** (see below).

### What you need before you start

| Item | Required? | Notes |
|---|---|---|
| Member's name | Yes | e.g. Rep. Mark DeSaulnier |
| This year's policy materials (Legislative Packet) | Yes | PDF, Word, or text. Use the current year's version |
| Meeting FAQ | Optional | Used for the "likely questions" section |
| Who you're meeting | Optional | **Staff (default)** or **the Member**. Most meetings are with staff |
| Delegation background | Optional | e.g. who lives or works where; used to find authentic connections |
| Meeting date | Optional | Used for the day-of recheck list |

> Important: the AI must be able to **browse the web** to check live congressional data. Make sure Web search is turned on.

---

### Installation

Pick the tool you use. **No coding required; every step below is point-and-click or copy-paste.**

#### Step 0: Download this project (everyone does this first)

1. On this page, click the green **Code** button → **Download ZIP**
2. Unzip it to get a folder named `congressional-search-skill-main`

#### A. Claude Desktop app / claude.ai web (easiest)

Requires a paid plan (Pro / Max / Team / Enterprise) with code execution enabled. Menu names may vary slightly by version.

1. Use `dist/congressional-advocacy.zip` from the folder (**do not unzip it**)
2. Open Claude → profile (bottom left) → **Settings** → **Capabilities**
3. Make sure **Code execution** is on, then find the **Skills** section
4. Click **Upload skill** and choose `congressional-advocacy.zip`
5. Switch `congressional-advocacy` on
6. Start a new chat and make sure **Web search** is enabled

#### B. Claude Code (terminal / VS Code / Code tab in the desktop app)

1. Open a terminal (Mac: search "Terminal" in Spotlight)
2. Go to the unzipped folder:
   ```bash
   cd ~/Downloads/congressional-search-skill-main
   ```
3. Run:
   ```bash
   ./install.sh claude
   ```
4. Restart Claude Code, then type `/congressional-advocacy`

> Prefer no commands? Copy the whole `skills/congressional-advocacy` folder into `~/.claude/skills/` (create the folder if it doesn't exist).

#### C. Codex (OpenAI Codex CLI / app / IDE extension)

1. Go to the unzipped folder as above
2. Run:
   ```bash
   ./install.sh codex
   ```
3. Restart Codex, then type `$congressional-advocacy` or just describe what you need

> Manual install: copy `skills/congressional-advocacy` into `~/.codex/skills/`.
> To install for both Claude Code and Codex, run `./install.sh` with no argument.

#### D. Other AI tools (ChatGPT, Gemini, Cursor, Copilot, …)

If the tool supports Agent Skills / `SKILL.md`, put the `skills/congressional-advocacy` folder in that tool's skills directory.

If not, a paste-in approach gets you most of the value:

1. Start a new chat with web search on
2. Paste the full contents of `skills/congressional-advocacy/SKILL.md` (and upload the three files in `references/` if file upload is available)
3. Upload your policy materials and give the member's name

---

### How to use it

After installing, start a new chat and talk normally.

**Example 1: basic (meeting with staff by default)**
```
Prepare a meeting brief for Rep. Mark DeSaulnier.
I've attached this year's Legislative Packet and FAQ.
```

**Example 2: meeting the Member in person, with delegation details**
```
Prepare a brief for Sen. Alex Padilla. We're meeting the Senator personally.
Policy: packets/2026/senate-packet.pdf
Delegation: Amy lives in Los Angeles and works at USC; Kevin works at a semiconductor company.
Meeting date: 2026-11-05
```

In Claude Code or Codex you can pass file paths directly, or start with `/congressional-advocacy` (Claude Code) / `$congressional-advocacy` (Codex).

### Staff mode vs. Member mode

| | Staff mode (default) | Member mode |
|---|---|---|
| Rapport | Minimal small talk; one authentic constituent/local tie to explain the visit | Full personal / district / professional connection strategy |
| Asks (CTAs) | Written so a staffer can carry them back, with contact and deadline | Addressed directly to the Member |
| Pacing | Ask-first, more time for process questions | Room for rapport and discussion |
| Tracking | "Will recommend to the Member" = LEAN YES, not a commitment | Member's own commitment can be logged YES |

### Updating policy materials each year

This skill has **no built-in bills**. Every year:

1. Organize that year's bills using [`policy-packet-template.md`](skills/congressional-advocacy/references/policy-packet-template.md) (or use the PDF/Word packet your organization issues)
2. Attach it each time you run the skill
3. The AI re-verifies status on Congress.gov and tells you where it differs from your packet

### FAQ

- **The AI says it can't find data?** Make sure web search is on.
- **Results contain "NEEDS RECHECK"?** That fact changes often or couldn't be confirmed. Click the links and recheck the morning of the meeting (especially cosponsor lists).
- **Can I fully trust it?** No. It cites sources; always click through to verify key facts before the meeting.
- **How do I update the skill?** Download the repo again and reinstall (for Claude Desktop, re-upload the zip).

---

### For maintainers

Skill source lives in `skills/congressional-advocacy/`. After editing, rebuild the Claude Desktop zip:

```bash
cd skills && rm -f ../dist/congressional-advocacy.zip && zip -rq ../dist/congressional-advocacy.zip congressional-advocacy -x '*.DS_Store'
```
