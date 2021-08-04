/* Serenade Custom Commands

In this file, you can define your own custom commands with the Serenade API.

For instance, here's a custom automation that opens your terminal and runs a command:

serenade.global().command("make", api => {
  api.focusApplication("terminal");
  api.typeText("make clean && make");
  api.pressKey("return");
});

And, here's a Python snippet for creating a test method:

serenade.language("python").snippet(
  "test method <%identifier%>",
  "def test_<%identifier%>(self):<%newline%><%indent%>pass",
  { "identifier": ["underscores"] }
  "method"
);
 more information, check out the Serenade API documentation: https://serenade.ai/docs/api
*/
serenade.app("code").command("function p list <%text%>", async (api, matches) => {
  var txt = matches.text.split(" ");
  var first = `def ${txt[0]}(`;
  api.pressKey("i");
  api.typeText(first)
  for (var i = 1; i < txt.length; i++) {
    if (i === (txt.length -1)) {
      api.typeText(`${txt[i]}):`);
      api.pressKey("return");
      api.pressKey("tab");
      api.typeText(`pass`);
    } else { 
      api.typeText(`${txt[i]}, `);
    }
  }
})
serenade.app("terminal").command("commit <%text%>", async (api, matches) => {
  api.typeText(`git add . && git commit -m "${matches.text}"`);
  api.pressKey("return");
})
serenade.app("code").command("commit <%text%>", async (api, matches) => {
  api.typeText(`git add . && git commit -m "${matches.text}"`);
  api.pressKey("return");
})
serenade.app("terminal").command("clear", async (api, matches) => {
  api.typeText(`clear`);
  api.pressKey("return");
})
serenade.app("terminal").command("git push", async (api, matches) => {
  api.typeText(`git push`);
  api.pressKey("return");
})
serenade.app("code").command("git push", async (api, matches) => {
  api.typeText(`git push`);
  api.pressKey("return");
})
serenade.app("terminal").command("git pull", async (api, matches) => {
  api.typeText(`git pull`);
  api.pressKey("return");
})
serenade.app("code").command("git pull", async (api, matches) => {
  api.typeText(`git pull`);
  api.pressKey("return");
})
serenade.app("terminal").command("git checkout <%text%>", async (api, matches) => {
  api.typeText(`git checkout ${matches.text}`);
  api.pressKey("return");
})
serenade.app("code").command("git checkout <%text%>", async (api, matches) => {
  api.typeText(`git checkout ${matches.text}`);
  api.pressKey("return");
})
serenade.app("terminal").command("git checkout new <%text%>", async (api, matches) => {
  api.typeText(`git checkout -b ${matches.text}`);
  api.pressKey("return");
})
serenade.app("code").command("git checkout new <%text%>", async (api, matches) => {
  api.typeText(`git checkout -b ${matches.text}`);
  api.pressKey("return");
})
serenade.app("terminal").command("ls", async (api, matches) => {
  api.typeText(`ls`);
  api.pressKey("return");
})
serenade.app("terminal").command("ls <%text%>", async (api, matches) => {
  var dir = matches.text;
  dir = dir.replace(" ", "/");
  api.typeText(`ls ${dir}`);
  api.pressKey("return");
})
serenade.app("terminal").command("cd <%text%>", async (api, matches) => {
  var dir = matches.text;
  dir = dir.replace(" ", "/");
  api.typeText(`cd ${dir}`);
  api.pressKey("return");
})
serenade.app("code").command("cd <%text%>", async (api, matches) => {
  var dir = matches.text;
  dir = dir.replace(" ", "/");
  api.typeText(`cd ${dir}`);
  api.pressKey("return");
})
serenade.app("terminal").command("cd absolute <%text%>", async (api, matches) => {
  var dir = matches.text;
  dir = dir.replace(" ", "/");
  api.typeText(`cd ~/${dir}`);
  api.pressKey("return");
})
serenade.app("code").command("cd absolute <%text%>", async (api, matches) => {
  var dir = matches.text;
  dir = dir.replace(" ", "/");
  api.typeText(`cd ~/${dir}`);
  api.pressKey("return");
})
serenade.app("terminal").command("install warp", async (api, matches) => {
  api.typeText("python setup.py install");
  api.pressKey("return");
})
serenade.app("code").command("install warp", async (api, matches) => {
  api.typeText("python setup.py install");
  api.pressKey("return");
})
serenade.app("terminal").command("warp transpile <%text%>", async (api, matches) => {
  api.typeText(`warp transpile ${matches.text}.sol`);
  api.pressKey("return");
})
serenade.app("code").command("warp transpile <%text%>", async (api, matches) => {
  api.typeText(`warp transpile ${matches.text}.sol`);
  api.pressKey("return");
})
serenade.app("terminal").command("warp status <%text%>", async (api, matches) => {
  api.typeText(`warp status ${matches.text}`);
  api.pressKey("return");
})
serenade.app("code").command("warp status <%text%>", async (api, matches) => {
  api.typeText(`warp status ${matches.text}`);
  api.pressKey("return");
})
serenade.app("terminal").command("warp deploy <%text%>", async (api, matches) => {
  api.typeText(`warp deploy ${matches.text}.cairo`);
  api.pressKey("return");
})
serenade.app("code").command("warp deploy <%text%>", async (api, matches) => {
  api.typeText(`warp deploy ${matches.text}.cairo`);
  api.pressKey("return");
})
serenade.app("terminal").command("git status", async (api, matches) => {
  api.typeText(`git status`);
  api.pressKey("return");
})
serenade.app("code").command("git status", async (api, matches) => {
  api.typeText(`git status`);
  api.pressKey("return");
})
serenade.app("terminal").command("open warp dir", async (api, matches) => {
  await api.focusOrLaunchApplication("terminal");
  api.typeText(`cd /home/greg/dev/warp`);
  api.pressKey("return");
})
serenade.app("code").command("open warp dir", async (api, matches) => {
  api.typeText(`cd /home/greg/dev/warp`);
  api.pressKey("return");
})
serenade.global().command("open warp code", async (api, matches) => {
  await api.focusOrLaunchApplication("terminal");
  api.typeText(`cd /home/greg/dev/warp`);
  api.pressKey("return");
  api.typeText(`code .`);
  api.pressKey("return");
})



