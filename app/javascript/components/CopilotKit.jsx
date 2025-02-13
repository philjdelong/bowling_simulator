import "./globals.css";
import { CopilotKit } from "@copilotkit/react-core";
import { CopilotPopup } from "@copilotkit/react-ui";
import "@copilotkit/react-ui/styles.css";

export default function CopilotKit() {
    return (
        <html lang="en">
            <body>
                <CopilotKit publicApiKey="ck_pub_366883607dafcbc48a60829a2be619f8">
                    <CopilotPopup
                        labels={{
                        title: "Popup Assistant",
                        initial: "How can I help you today?"
                        }}
                        instructions="AI help that shows up right when you need it"
                    />
                </CopilotKit>
            </body>
        </html>
    );
}