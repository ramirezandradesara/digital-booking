import React, { Component } from "react";
import Portal from "./Portal";

export default class Modal extends Component {
  render() {
    const { children, modalActive } = this.props;

    return (
      <Portal>
        {modalActive && (
          <div style={styles.wrapper}>
            <div>{children}</div>
          </div>
        )}
      </Portal>
    );
  }
}

const styles = {
  wrapper: {
    // position: "absolute",
    position: "fixed",
    top: 0,
    left: 0,
    width: "100%",
    height: "100%",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    zIndex: 1000,
  },
};
