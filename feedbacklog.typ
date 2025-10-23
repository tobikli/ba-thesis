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
  feedback: "The objectives slide of the presentation should formulated in the verbal action form rather than just listing the names and descriptions of the objectives.",
  response: "To help the audience to follow the presentation easier, the objectives were rewritten in the verbal action form to make it more clear and concise and to make it more consistent with the status slide."
)

#feedback(
  feedback: "The demo including the dynamic flow using the LLMs. Is there an API on how to do that, and what exactly did I use.",
  response: "The exact implementation of the dynamic flow were out of scope of the actual presentation, but are available as backup slides. The LLM communicates via the MCP framework, allowing the LLM to communicate with local tools."
)

#feedback(
  feedback: "Does Playwright support this interaction out of the box and how does the LLM interact with the interface.",
  response: "Microsoft provides a MCP server for its Playwright framework that already includes most of the functionality for LLMs to interact with webpages."
)

#feedback(
  feedback: "The limitation of the deployment of Artemis and Theia in a pipeline should be mentioned.",
  response: "A corresponding chapter in the thesis was  added to discuss the limitations of the deployment of Artemis and Theia in a pipeline."
)

#feedback(
  feedback: "The status slide is not consistent with the objectives slide regarding the goals of the project.",
  response: "Together with the objectives slide, the status slide was updated to be more consistent with the goals of the project."
)