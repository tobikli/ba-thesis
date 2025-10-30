#import "/layout/feedbacklog_template.typ": *
#import "/metadata.typ": *
#import "/utils/feedback.typ": *

#set document(title: titleEnglish, author: author)

#show: feedbacklog.with(
  titleEnglish: titleEnglish,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  presentationDate: presentationDate,
  feedbacklogSubmissionDate: feedbacklogSubmissionDate,
)

#feedback(
  feedback: "The objectives slide of the presentation should be formulated in verbal action form rather than simply listing the names and descriptions of the objectives.",
  response: "To help the audience follow the presentation more easily, the objectives were rewritten in verbal action form to make them clearer, more concise, and consistent with the status slide."
)

#feedback(
feedback: "The demo shows the dynamic flow using large language models (LLMs). Is there an available API for this interaction, and which components or tools were used in the implementation?",
response: "The exact implementation of the dynamic flow was out of scope for the actual presentation but was included in the backup slides. The LLM communicates via the Model Context Protocol (MCP) framework, allowing it to interact with local tools."
)

#feedback(
feedback: "Does Playwright support this type of interaction out of the box, and how does the LLM communicate with the interface?",
response: "Microsoft provides an MCP server for its Playwright framework that already includes most of the functionality needed for LLMs to interact with web pages."
)

#feedback(
feedback: "The limitations regarding the deployment of Artemis and Theia within a pipeline should be mentioned.",
response: "A corresponding chapter in the thesis was added to discuss the limitations of deploying Artemis and Theia within a pipeline environment."
)

#feedback(
feedback: "The status slide should be consistent with the objectives slide in terms of the project’s goals.",
response: "Together with the objectives slide, the status slide was updated to ensure alignment with the project’s goals."
)
