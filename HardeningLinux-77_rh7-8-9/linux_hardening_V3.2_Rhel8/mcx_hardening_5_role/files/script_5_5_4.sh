#!/usr/bin/env bash
for fn in system-auth password-auth; do
  file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$fn"
  if ! grep -Pq -- '^\h*password\h+(requisite|required|sufficient)\h+pam_unix\.so(\h+[^#\n\r]+)? \h+sha512\b.*$' "$file"; then
    if grep -Pq -- '^\h*password\h+(requisite|required|sufficient)\h+pam_unix\.so(\h+[^#\n\r]+)? \h+(md5|blowfish|bigcrypt|sha256)\b.*$' "$file"; then
      sed -ri 's/(md5|blowfish|bigcrypt|sha256)/sha512/' "$file"
    else
      sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix.so\s+)(.*)$/\1s ha512 \3/' $file
    fi
  fi
done
authselect apply-changes
