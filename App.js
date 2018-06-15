/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, {Component} from 'react';
import {NativeModules} from 'react-native';
import {
    StyleSheet,
    Button,
    View
} from 'react-native';

type Props = {};
export default class App extends Component {
    onPressLearnMore() {
        var NotificationMAnager = NativeModules.NotificationManager;
        //title and body to display in the notificaiton
        var title = "HPS Labs Assignment";
        var body = "To generate notification using React and native iOS";
        //To generate notification from native iOS Module
        NotificationMAnager.showNotification(title, body,(error, response) => {
            //callbacks to handle error and succes response.
            if (error) {
                console.log()
            } else {
                console.log("Notification Generated");
            }
        });
    }

    render() {
        return (
            <View style={styles.container}>
              <Button
                  onPress={this.onPressLearnMore}
                  title="click to generate notification"
                  color="#841584"
                  accessibilityLabel="Learn more about this purple button"
              />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        margin: 10
    }
});
