# FOCP

 1. What term is used to describe the ability to identify and allocate costs to the appropriate cost categories in use by a customer?
 
    **Cost Allocation**
 
    In FinOps, the ability to identify and allocate costs to the appropriate cost categories in use by a customer. Ideally direct costs (the cost of resources running in my accounts), amortized costs (the amortization of prepaid costs paid upfront for RIs applied in my accounts), and shared costs (my share of common services accounts run by others on my behalf) can be allocated to individual budgeting categories for a clear view of the entire cost of running my application or workload in the cloud.
    Reference: Please review the terminology page before the exam https://www.finops.org/resources/terminology/ 
 
 2. Each major cloud provider labels the platforms 'allocation metadata' a specific way. How does GCP name the allocation metadata?
    
    **"Labels" and "billing acounts"**
    Explicación
    GCP( Google Cloud Platform)- “labels” and “billing accounts”;
    GCP uses “labels” and “billing accounts”;
    AWS “resource tags”, “Linked Accounts” and “Organizations”;
    Azure “Subscriptions”, “Resource Groups” and “resource tags”
    We do need to know some cloud provider specific terms for the exam.
    Refer here before the exam [FinOps Terminology](https://www.finops.org/resources/terminology/)
  
 3. AWS provides what is called a 'Blended Rate' on its invoices. What is the blended rate showing?
   
    **Shows the effective rate for a group of resources with the same attributes.**

    AWS provides Blended Rate information on its invoice showing the effective rate for a group of resources with the same attributes where some of the resources are receiving a discount from reservations and some are not.

    Terminology is a critical knowledge area for the exam.

 4. Which of the following is NOT part of the FinOps Maturity Model?
   
    **Sprint**

    A “Crawl, Walk, Run” approach to performing FinOps enables organizations to start small, and grow in scale, scope and complexity as business value warrants maturing a functional activity. Taking quick action at a small scale and limited scope allows FinOps teams to assess the outcomes of their actions, and to gain insights into the value of taking further action in a larger, faster, or more granular way.

    Reference: Please review this page before the exam. [FinOps Maturity Model](https://www.finops.org/framework/maturity-model/)

 5. 'Establish FinOps Culture' would be under what domain according to the FinOps Foundation?
    **Organizational Alignment**

    Explanation: There are six specific domains in FinOps according to the FinOps Foundation. We will want to be able to understand what topics are covered by each domain.

    ![domains](images/focp_5.png)

 6. Multiple Selection:(Select two). Which of the following statements would be true regarding deploying Kubernetes clusters concerning cost complexity?
    **Generally organizations have multiple teams consuming portions of those underlying container resources**

    **The average lifespan of a container being one day versus a typically much longer utilization time for a VM**

    Explanation: Managing Kubernetes clusters on just about any cloud platform is very challenging due to the complexity of how Kubernetes is deployed, how resources are consumed and the general lack of real time visibility. Secondly, all providers charge for additional resource usage so for the example the amount of bandwidth or storage API access may not be visible even with tagging.

    Please refer to this page before the exam. [Calculating Container Costs (finops.org)](https://www.finops.org/projects/calculating-container-costs/)

 7. Which of the following is the best definition of a Kubernetes Pod?
    **A pod consists of a group of containers and treats them as a single block of resources that can be scheduled and scaled on the cluster.**

    Explanation: The other answers are incorrect and are variations of the correct answer.

    Reference: Please review the terminology here for containers. [Calculating Container Costs (finops.org)](https://www.finops.org/projects/calculating-container-costs/)

 8. _ _ _ _ _ _ or _ _ _ _ _ _ is the foundation of telling apart workloads in the cloud, identifying ownership, and attributing costs to teams.
    **Tagging or Labeling.**

    Explanation: Tagging or labeling is the foundation of telling apart workloads in the cloud, identifying ownership, and attributing costs to teams. 
    Read more about forecasting. [Accurate Cloud Forecasts (finops.org)](https://www.finops.org/projects/forecasting-cloud-costs/).

 9. Multiple Selection:(Select three)

    Cloud Forecasting can be a challenge, especially in large disparate organizations. Centralization can be a helpful factor but also there are some focus areas that we can use to 'break the challenge into addressable parts'.

    **Tagging and cost allocation can provide insight into resource spending.**

    **Use forecasting models to help provide predicable models for consistency.**
    
    **Use communications to relay that forecasting is being used for decision making**
    
    Explanation: The other answers are incorrect.  For example, we can use both third party and provider tools since some providers may not provide all the reports, features etc. we may want. It is also a Finops best practice to actually centralize our FinOps practice and provide consistency in our reporting/forecasting.
    
    Reference: [https://www.finops.org/projects/accurate-cloud-forecasts/](https://www.finops.org/projects/accurate-cloud-forecasts/)
 
 10. True or False:

    Distributed decision making coupled with the move to variable spending in cloud allows technology teams to efficiently partner with finance and business teams to make informed decisions that drive continual optimization.

    **True**

    Explicación
    Statement is correct. Remember that FinOps is really about collaboration.

    Reference: [FinOps Foundation - What is FinOps?](https://www.finops.org/introduction/what-is-finops/)

 11. When comparing TBM and FinOps, which one would focus on results mainly on speed?
     
    **FinOps**
     
    FinOps is focused on results much more frequently than with TBM. TBM is monthly or quarterly focused whereas FinOps collects and reviews data constantly.

    Technology Business Management (TBM), a best practice discipline for IT business management; and FinOps, the financial operating model for public cloud consumption, share the same goal of defining IT by impact rather than spend.
    
    TBM was built to serve the needs of on-prem IT with data-driven decision-making to manage, plan, and optimize spend. TBM has incorporated data-driven decision-making for the cloud but doesn’t manage the complexities of allocating cloud costs and the prescriptive methods of controlling those costs. TBM looks at the “what” of all IT spend, including a macro view of cloud spend.
    
    By bringing together people (and data) from IT finance, operations, and business, TBM creates a community of stakeholders to manage all IT.
    
    FinOps was born for the cloud. Systems, best practices, and cultures increase an organization’s ability to understand cloud costs and make informed and timely balancing decisions. FinOps focuses on optimizing the cost and utilization of the cloud through technical and organizational means.

 12. True or False: In regards to cloud forecasting there is no one forecasting method that fits all situations.
    
    **True**

    Every organization and even cloud provider has different requirements that are to be met or are met. Some organizations my need a granular VM pricing whereas other may not.

    Some cloud providers support things diffferently than other and therefor require the organization to consider the best model they need. Unfortunately there is no one forecasting method that fits all situations. Cloud spend is variable which is inherently difficult to predict.
    
    Specifically engineers can start workloads at any time typically without having to go through a procurement process. Forecasting cloud-provider consumption as product or service consumption requires specific data and tooling to be consistently available.
    
    Billing and reporting from cloud providers is difficult to understand and explain to traditional finance teams. Workloads need to be clearly defined whether through tagging or account structures so that cost can be attributed back to them and their owners.
    
    Please review this page before the exam. [Accurate Cloud Forecasts (finops.org)](https://www.finops.org/projects/forecasting-cloud-costs/)

 13. When proposing the adoption of a FinOps function within an organization, there will be a need to brief a variety of personas among the executive team to gain approval, buy-in, and involvement in conducting FinOps and achieving its goals. Every role has a clearly documented Primary Goal. What is the primary goal for a Chief Technology Officer (CTO)?
    
    **Leverage technology to give the business a market and competitive advantage**

    Explanation: There are clearly labeled roles for each 'Persona' and we must learn these for the exam.

    Reference:  [FinOps Personas](https://www.finops.org/framework/personas/)

 14. True or False: In FinOps decisions are not driven by the business value of the cloud?
     
     **False**

     In FinOps decisions are driven by the business value of the cloud. With FinOps we look at the cloud as a business value creator. One of the main roles of FinOps is to maximize the value of the cloud spending.

 15. Which of the following terms are associated with Agile?
     
    **Sprint**

    *Explicación*: There are several terms affiliated with Agile development such as Sprint, User Story, Epics, Lean, etc. Rightsizing, Zones and Regions are cloud computing terms.

    Sprint a short interval of work in an Agile project, usually a week or two weeks but sometimes more or less, during which time an agreed-upon amount of work will be delivered.
    
    Reference:
    
    Please review the Terminology page before the exam. [https://www.finops.org/resources/terminology/](https://www.finops.org/resources/terminology/)

 16. In Cloud Computing some costs can be considered fixed and some are variable. Which of the following costs would generally a fixed costs, meaning predictable monthly or annual costs?
    
    **Support and Maintenance**

    Explanation: Support and Maintenance are almost always a fixed cost meaning that you would pay a certain amount for a specific amount of support/users/response times. Variable costs would be about any resource you would use.
    
    Reference: Please review this page before the exam. [FinOps Terminology](https://www.finops.org/resources/terminology/)

 17. Which of the following roles/personas would be responsible for 'Rate Negations' with a cloud provider?
   
    **Procurement**

    Explanation: Procurement is handled somewhat different in the world of FinOps.
    
    We know that Procurement is moved from a CAPEX to a OPEX manner in the cloud. Procurement should have the following objectives in a FinOps organization. Negotiate the best win-win cloud contract, Exercise enterprise discount / volume commitment programs and Manage relationship with Cloud platform provider.
    
    Reference: Please review this page before the exam [https://www.finops.org/framework/personas/#product-owner](https://www.finops.org/framework/personas/#product-owner)
 
 18. True or False: FinOps is about saving money. 
    
    **False**

    Explicación
    FinOps is about making money. Cloud spend can drive more revenue, signal customer base growth, enable more product and feature release velocity, or even help shut down a data center.

    Please refer to this page. [FinOps Foundation - What is FinOps?](https://www.finops.org/introduction/what-is-finops/)
 
 19. Your organization has recently adopted a FinOps based method for dealing with cloud costs and adopting FinOps. Currently, your organization has recently completed 'Step Two' for FinOps culture in your company. What would the next stage for the organization to accomplish?
    
    **Preparing the organization for FinOps**

    Explanation: The next step after Stage 1 - Planning for FinOps in an Organization (Laying the groundwork) is the Stage 2 - Socializing FinOps for adoption in an organization. Then After Step 2 would be Stage 3 - Preparing the organization for FinOps
    
    Reference: Please reference this page before the exam. [Adopting FinOps - Getting Started](https://www.finops.org/projects/adopting-finops/)

 20. Multiple Selection: (Select three) Which activities would fit under the FinOps principle of ' Decisions are driven by business value of cloud' ?
    
    **Trending and variance analysis helps to understand why costs increased**

    **Internal team benchmarking drives best practices and celebrates wins**

    **Industry peer-level benchmarking determines how your company is performing**

    Explicación: Decisions are driven by business value of cloud The other activities are under a different phase of activities.

    Please reference this page, section. [https://www.finops.org/framework/principles/](https://www.finops.org/framework/principles/)
 
 21. Which service on AWS used to download and store the Cost and Usage report on so you can query it?

    **AWS S3**

    AWS S3 is the service for storing data on AWS. You can publish your AWS billing reports to an Amazon Simple Storage Service (Amazon S3) bucket that you own and choose to use that how you like.

    Reference: [https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.htm](https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.htm)

 22. True or False: A key role toward building FinOps adoption is the Driver.
    
    **True**

    A key role toward building FinOps adoption is the Driver which means that we must get broad executive support and buy-in to dedicate the time and resources needed for the cultural change.

     Reference:

     Please review this page before the exam. [https://www.finops.org/projects/adopting-finops/](https://www.finops.org/projects/adopting-finops/)

 23. FinOps Principles are north stars that guide the activities of our FinOps practice. These principles are clearly broken down and we must encourage members to practice these. When it comes to these principles which of the following activities would be under the 'Teams need to Collaborate' principle?
    
    **Define governance and controls for cloud usage**

    Explanation: Honestly, some of these activities may or not intuitively seem like they are under specific principles. This is perhaps the most confusing part of the content to remember. For Teams need to collaborate these are the activities specified by the FinOps Foundation: Finance moves at the speed and granularity of IT Engineering considers cost as a new efficiency metric Continuously improve your practice to gain efficiency and innovation Define governance and controls for cloud usage.
    
    Reference:
    
    Please refer to this page before the exam. [FinOps Principles](https://www.finops.org/framework/principles/)
 
 24. In regards to the FinOps Maturity Model Guidelines which of the following statements would be true regarding the Maturity Level Characteristics for 'Run'.

    **Capability is understood and followed by all teams within the organization**

    Explicación

    The guidelines and characteristics are clearly defined by the FinOps Foundation and these are a must know for the exam.
    
    RUN MATURITY CHARACTERISTICS Capability is understood and followed by all teams within the organization Difficult edge cases are being addressed Very high goals/KPIs set on the measurement of success Automation is the preferred approach The maturity model
    
    Must read. [FinOps Maturity Model](https://www.finops.org/framework/maturity-model/)

 25. AWS has a wealth of FinOps capabilities that we could use as an AWS user. Which of the following AWS Services would we use to track costs and usage and send alerts when a threshold is exceeded.

    **AWS Budgets**

    Explanation: AWS Budgets allows users to set up alerts, initiated when actual or forecasted costs and usage exceed predetermined budget thresholds. The goal of AWS Budgets is to reduce unintentional over-spending. AWS Budgets also allows for the configuration of automated responses if costs or usage exceed desired limits.
    
    [https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html)
 
 26. Your FinOps leader and mentor has reached out to you to find out more about Azure Capabilities. What tool in Azure would you use to implement enforcement of Tagging on Azure?

    **Azure Policy**
   
    Explanation: You use Azure Policy to enforce tagging rules and conventions. By creating a policy, you avoid the scenario of resources being deployed to your subscription that don't have the expected tags for your organization. Instead of manually applying tags or searching for resources that aren't compliant, you create a policy that automatically applies the needed tags during deployment.

    Tags can also now be applied to existing resources with the new Modify effect and a remediation task. The following section shows example policy definitions for tags.

    References: 
    [https://www.finops.org/projects/multi-cloud-tools-and-terminology/](https://www.finops.org/projects/multi-cloud-tools-and-terminology/)

    [Policy definitions for tagging resources - Azure Resource Manager | Microsoft Learn](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-policies)

 27. Which stage in the FinOps Adoption Process would we be 'performing initial resourcing' such as getting budget approval?
    
    **Stage 1 - Planning for FinOps in an Organization (Laying the groundwork) **
    
    Explanation: When planning for FinOps we must assemble resources, estimate, review, plan and assemble people and all this is done in the first stage.

    Please review this page before the exam. [Adopting FinOps - Getting Started](https://www.finops.org/projects/adopting-finops/)

 28. Each of the cloud providers have tools that can help FinOps professionals specifically in that cloud platform. You have been working with AWS for over 1 year. You know would like to go back and view the billing reports but also perform a detailed report for BI analysis. What AWS service could you use?
    
    **AWS QuickSight** 
    
    is a cloud-native, serverless, business intelligence with native ML integrations and usage-based pricing, allowing insights for all users.

    Reference: 
    
    [https://www.finops.org/projects/multi-cloud-tools-and-terminology/](https://www.finops.org/projects/multi-cloud-tools-and-terminology/)

    [AWS](https://aws.amazon.com/quicksight/)

 29. Which of the following statements would be correct about Weighted Average Cost of Capital?
    
    **This is the rate the company is expected to pay on average to all its securities holders to finance the operation of the business.**

    Weighted Average Cost of Capital - the rate the company is expected to pay on average to all its securities holders to finance the operation of the business. Importantly this is set by the external market (what the market is willing to pay for various forms of the company’s securities) not by management.
    
    Reference: [FinOps Terminology](https://www.finops.org/resources/terminology/)

 30. Which of the following a native tool in AWS that we would use in our FinOps exercises to understand costing issues, get recommendations, etc.
   
    **Cost Explorer**

    Explanation: Cost Explorer is a free tool that AWS offers to all customers that provides visibility across the AWS infrastructure and has features like rightsizing, savings plans recommendations, and cost anomaly alerting. Cost and Usage Reports (CUR) provides no recommendations and it is important to that Trusted Advisor has free and paid support options but does not provide insight into billing.
    
    Reference: [https://aws.amazon.com/aws-cost-management/aws-cost-explorer/](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/)

 31. FinOps Principles are north stars that guide the activities of our FinOps practice. They’re developed by FinOps Foundation members, and honed through experience. When it comes to the FinOps principle of 'A centralized team drives FinOps' which of the following statements would be true?
   
    **Centralized discount buying process removes rate negotiations from engineering team consideration.**

    Explicacion: Using a granular approach is recommended and Track team-level targets to drive accountability is not under the A centralized team section, it is under 'Everyone takes ownership for their cloud usage'

    Reference: Please review this page before the exam. [FinOps Principles](https://www.finops.org/framework/principles/)

 32. 'Manage Commitment Based Discounts' would be under what domain according to the FinOps Foundation?
    
    **Cloud Rate Optimization**

    Explanation: There are six specific domains in FinOps according to the FinOps Foundation. We will want to be able to understand what topics are covered by each domain.
    
    Reference: [Managing Commitment Based Discounts (finops.org)](https://www.finops.org/framework/capabilities/manage-commitment-based-discounts/)

 33. Multiple Selection: (Select two) Your business unit has decided to use Azure for its cloud services for production. Other business units have been Azure for both development and production use cases. You have been asked to provide tools in Azure that can provide recommendations for reducing costs and getting insight into better ways of resource management. What tools in Azure could you identify?
    
    **Azure Advisor**
    
    **Azure has only one tool** 
    
    Explanation: Every cloud provider has their own approach for billing and cost management. We need to know the three major providers in preparation for the exam.

    Reference: Please refer to this page for a handy table. [Multi-Cloud Tools and Terminology (finops.org)](https://www.finops.org/projects/multi-cloud-tools-and-terminology/)

 34. When rightsizing your containers which of following would be focused on responding dynamically to different conditions?
    
    **Autoscaling**

    Autoscaling provides the ability to respond dynamically to different conditions, such as increased or decreased demand. This can take some architecting and iterative adjustments to get right for your application, and there is room for waste along the way. However, the more tightly your horizontal pod autoscaling (when we need more / less pods) and cluster autoscaling (when do we need more / less nodes) are configured, the less waste and unnecessary cost to run your application.
    
    Please review this page before the exam. (Section Optimize)
    
    Reference: [Calculating Container Costs (finops.org)](https://www.finops.org/projects/calculating-container-costs/)

 35. _ _ _ _ _ _ _ _is the idea is to measure cloud spend against a business metric or metrics such as revenue, subscribers, etc. What is the correct term?

    **Unit Economics**

    Explanation:

    One of the most important concepts in FinOps is Unit Economics.
    
    The idea is to measure cloud spend against a business metric (total revenue, shipments made, paid subscribers, customer orders completed, etc.). Choosing the right business metric is a complex process. For now, the main thing to remember is that Unit Economics relies on almost every aspect of FinOps, including tagging, cost allocation, cost optimization, and FinOps operations. This business metric is important, because it allows you to change the conversation from one that is just about dollars spent to one about efficiency and the value of cloud spend.
    
    Reference: [https://www.finops.org/project/introduction-cloud-unit-economics/](https://www.finops.org/project/introduction-cloud-unit-economics/)

 36. 
    








