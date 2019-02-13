
### Info.plist

Info.plistの`{{API key}}`と`{{API secret key}}`部分を書き換えてください。

```
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLName</key>
			<string>twitter</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>twitterkit-{{API key}}</string>
			</array>
		</dict>
	</array>

	<key>TwitterConsumerKey</key>
	<string>{{API key}}</string>
	<key>TwitterConsumerSecret</key>
	<string>{{API secret key}}</string>
```