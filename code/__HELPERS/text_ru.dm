// ��� 513 � ����� ���
// ������� �������
// ��� ���� � White Dream.

GLOBAL_LIST_INIT(rus_unicode_conversion_hex,list(
	"�" = "0410", "�" = "0430",
	"�" = "0411", "�" = "0431",
	"�" = "0412", "�" = "0432",
	"�" = "0413", "�" = "0433",
	"�" = "0414", "�" = "0434",
	"�" = "0415", "�" = "0435",
	"�" = "0416", "�" = "0436",
	"�" = "0417", "�" = "0437",
	"�" = "0418", "�" = "0438",
	"�" = "0419", "�" = "0439",
	"�" = "041a", "�" = "043a",
	"�" = "041b", "�" = "043b",
	"�" = "041c", "�" = "043c",
	"�" = "041d", "�" = "043d",
	"�" = "041e", "�" = "043e",
	"�" = "041f", "�" = "043f",
	"�" = "0420", "�" = "0440",
	"�" = "0421", "�" = "0441",
	"�" = "0422", "�" = "0442",
	"�" = "0423", "�" = "0443",
	"�" = "0424", "�" = "0444",
	"�" = "0425", "�" = "0445",
	"�" = "0426", "�" = "0446",
	"�" = "0427", "�" = "0447",
	"�" = "0428", "�" = "0448",
	"�" = "0429", "�" = "0449",
	"�" = "042a", "�" = "044a",
	"�" = "042b", "�" = "044b",
	"�" = "042c", "�" = "044c",
	"�" = "042d", "�" = "044d",
	"�" = "042e", "�" = "044e",
	"�" = "042f", "�" = "044f",

	"�" = "0401", "�" = "0451"
	))

/proc/cp1252_to_utf8(text) //��������� ����. ����������� �� ��, �� ��� � �� �����
	var/t = ""
	for(var/i = 1, i <= length(text), i++)
		var/a = text2ascii(text, i)
		if (a < 224 || a > 255)
			t += ascii2text(a)
			continue
		t += ascii2text(a + 848)
	return t

/proc/r_lowertext(text)
	var/t = ""
	for(var/i = 1, i <= length(text), i++)
		var/a = text2ascii(text, i)
		if (a == 1105 || a == 1025)
			t += ascii2text(1105)
			continue
		if (a < 1040 || a > 1071)
			t += ascii2text(a)
			continue
		t += ascii2text(a + 32)
	return lowertext(t)

/proc/r_uppertext(text)
	var/t = ""
	for(var/i = 1, i <= length(text), i++)
		var/a = text2ascii(text, i)
		if (a == 1105 || a == 1025)
			t += ascii2text(1025)
			continue
		if (a < 1072 || a > 1105)
			t += ascii2text(a)
			continue
		t += ascii2text(a - 32)
	return uppertext(t)

/proc/pointization(text)
	if (!text)
		return
	if (copytext_char(text,1,2) == "*") //Emotes allowed.
		return text
	if (copytext_char(text,-1) in list("!", "?", "."))
		return text
	text += "."
	return text

/proc/r_capitalize(t as text)
    var/first = ascii2text(text2ascii(t))
    return r_uppertext(first) + copytext(t, length(first) + 1)

/proc/r_antidaunize(t as text)
    var/first = ascii2text(text2ascii(t))
    return r_lowertext(first) + copytext(t, length(first) + 1)

/proc/r_json_decode(text) //now I'm stupid
	for(var/s in GLOB.rus_unicode_conversion_hex)
		text = replacetext(text, "\\u[GLOB.rus_unicode_conversion_hex[s]]", s)
	return json_decode(text)

/proc/r_stutter(text) //�������� ��������
	var/list/soglasnie = list(	"�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�",
								"�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�",
								"b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z",
								"B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","V","W","X","Y","Z")
	var/t = ""
	for(var/i = 1, i <= length(text), i++)
		var/a = text2ascii(text, i)
		if (prob(80) && (ascii2text(a) in soglasnie))
			if (prob(10))
				t += text("[ascii2text(a)]-[ascii2text(a)]-[ascii2text(a)]-[ascii2text(a)]")
			else
				if (prob(20))
					t += text("[ascii2text(a)]-[ascii2text(a)]-[ascii2text(a)]")
				else
					if (prob(5))
						t += ""
					else
						t += text("[ascii2text(a)]-[ascii2text(a)]")
		t += ascii2text(a)
	return copytext_char(sanitize(t),1,MAX_MESSAGE_LEN * length(ascii2text(text2ascii(t))))


