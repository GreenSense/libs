echo "Getting library files..."
echo "  Dir: $PWD"

sh get-nuget.sh
sh nuget-update-self.sh

sh install-package.sh BridgeArduinoSerialToMqttSplitCsv 1.0.1.2
sh install-package.sh NUnit 2.6.4
sh install-package.sh NUnit.Runners 2.6.4
sh install-package.sh Newtonsoft.Json 11.0.2
sh install-package.sh ArduinoSerialControllerClient 1.1.1.5
sh install-package.sh duinocom.core 1.0.6
sh install-package.sh M2Mqtt 4.3.0.0
sh install-package.sh ArduinoPlugAndPlay 1.0.0.1

echo "Finished getting library files."
