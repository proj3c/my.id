from regis import *

@bot.on(events.CallbackQuery(data=b'cekip'))
async def cekipp(event):
	async def cekipp_(event):
		async with bot.conversation(chat) as pw:
			await event.respond("**Input IP VPS:**")
			pw = pw.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			pw = (await pw).raw_text
		cmd = f'printf "%s\n" "{pw}" | bash /root/update/shel/bot-cekpelanggan'
		try:
			a = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			await event.respond("**Not Exist**")
		else:
			msg = f"""```{a}```
**» 🤖@fightertunnell**"""
			await event.respond(msg)
	chat = event.chat_id
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await cekipp_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)