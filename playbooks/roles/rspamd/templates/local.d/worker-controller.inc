# password = "$2$7r3tztztnq4au8yxf1d1rquxcig5rkhp$tyixq8m5znaqszt8januwhwg3wu9qu45nxo9g9r47d7d5hpbcq7y";
# enable_password = "$2$zgsyqmarfmck335s4sz3iwj5zyngibyh$yj8dwowityefdfn9mbeku4ijtkcpipkjsctknxmh43rkcac8s3dy";
password = "{{ rspamd_password | password_hash('sha512') }}"
enable_password = "{{ rspamd_enable_password | password_hash('sha512') }}"
