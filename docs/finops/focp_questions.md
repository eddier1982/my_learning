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

 36. FinOps Principles gives us what are called _ _ _ _ _ _ _ _to help guide our activities in FinOps.
    
    **North Stars**

    Explanation: [FinOps Principles](https://www.finops.org/framework/principles/) are north stars that guide the activities of our FinOps practice. They’re developed by FinOps Foundation members, and honed through experience. These were initially proposed as part of the writing the Cloud FinOps book in Sept 2019 as a joint AWS announcement at CloudyCon. Now, they cover multiple clouds, and knowing how cloud services change every quarter it seems, they may change slightly over time as new experience is gained by all.

 37. FinOps Practitioners use _ _ _ _ _ _ _ _ to provide insight into how well an organization is doing with cloud spend.
    
    **Cloud Performance Benchmarking**

    Explanation: Benchmarking is important because it provides a reference to measure against. There are both internal and external benchmarks to consider as well.
    
    Reference: [Performance Tracking & Benchmarking (finops.org)](https://www.finops.org/framework/domains/performance-tracking-benchmarking/)

 38. Multiple Selection: What would be some common names that could used for a FinOps team? (Select three)
    
    **Cloud Business Office (CBO)**
    
    **Cloud Economics Team** 
    
    **Cloud Center of Excellence**

    Explanation: A FinOps team may have different names in difference organizations.
    
    Here are some examples.
    
       - Cloud Business Office (CBO)
       - Cloud Economics Team
       - Cloud Center of Excellence
        
 39. What is the name of the file format used in AWS Cost and Usage reports?

    **CSV**

    Explanation: The AWS Cost and Usage Reports (AWS CUR) contains the most comprehensive set of cost and usage data available. AWS updates the report in your bucket once a day in comma-separated value (CSV) format. You can view the reports using spreadsheet software such as Microsoft Excel or Apache OpenOffice Calc, or access them from an application using the Amazon S3 API.
    
    Reference: [https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html](https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html)

 40. Multiple Selection : Select all the correct options. When managing cloud costs specifically around containers there are several things in Google Cloud we can do to manage costs and identify these costs. Which of the following would be ways we could break down costs? 
   
    **Billing Hierarchy**
    
    **Namespaces**
    
    **Labels**.

    Explanation: Google Cloud provides some robust methods to identify costs and also segment. Availability Zones is actually an AWS concept so that's incorrect. One method, recommended by Debo Aderibigbe, a Google Cloud Billing Product Manager, is to break down costs by:
    
    *Billing Hierarchy*: Organizations, folders, projects, normalizing them with cross-cloud concepts: Linked Accounts, Tags, Subscriptions, etc. Resources: Compute cores, RAM, GPU, TPU, Load Balancers, Persistent Disk, Custom Machines, Network Egress
    
    *Namespaces*: labeling specific, isolated containers

    *Labels*: Teams, cost centers, app names, environment, and more With a deep labeling and tagging of all of these cost drivers, users can improve the accuracy of how they invoice teams, audit costs, allocate costs, optimize overrun costs, model budgeting scenarios, or fit workload costs within quotas or under budget caps. Please review this page before the exam.

 41. Multiple Selection:(Select four) Which of the following are considered goals of the FinOps journey?
    
    **Visibility**
    
    **Benchmarking**
    
    **Budgeting** 
    
    **Forecasting** 

    Visibility, Benchmarking, Budgeting and Forecasting are goals of the FinOps Inform Phase. The Inform Phase of the FinOps journey is about understanding the current state of your system.
    
    Due to the on-demand and elastic nature of access to cloud resources, along with variable pricing structures, it is critical to have access to timely and accurate system metrics to make appropriate, informed decisions. In this phase there are five primary goals:
    
      - Visibilit
      - Allocatio
      - Benchmarkin
      - Budgetin
      - Forecasting

    Please review this page before the exam [https://www.finops.org/framework/phases/](https://www.finops.org/framework/phases/)

 42. An Availability Zone in AWS is defined as?
    
    **A sub-unit of a Region, there are typically multiple AZs per Region**

    In AWS a Region is a geographic area that holds multiple Availability Zones. AWS does not deploy a Region w/o at least three AZs available.

    Terminology is a critical knowledge area for the exam. [FinOps Terminology](https://www.finops.org/resources/terminology/)

 43. Which are the correct FinOps Principles? (Select Six) 

    **Teams need to collaborate**

    **Business value of cloud drives decisions**

    **Everyone takes ownership of cloud usage**

    **FinOps reports should be accessible and timely**

    **A centralized team drives FinOps**

    **Take advantage of the variable cost model of the cloud**


    Reference: Before the exam you must review this page! [https://www.finops.org/framework/principles/](https://www.finops.org/framework/principles/)

 44. What is the name of the resource you would look at to identify the full list of the columns that can appear in AWS Cost and Usage Reports (AWS CUR) and the services that the columns apply to?
    
    **Data Dictionary**

    Explanation: You can analyze your usage and cost in detail once you've set up your report. AWS has provided a Data Dictionary that lists the columns you'll see in your report, along with definitions and examples.
    
    Reference: [Data dictionary - AWS Cost and Usage Reports (amazon.com)](https://docs.aws.amazon.com/cur/latest/userguide/data-dictionary.html)

 45. Which of following is a simple formula for cloud spending?
    
    **Spend = Usage × Rate**

    The simple formula plays a key part of deciding both how to optimize and who in the organization takes optimization. Usage could be the number of hours of a resource used and the rate is the hourly (or per second) amount paid for the usage of that resource.

 46. Multiple Selection : (Select two) Your business unit has decided to use GCP for its cloud services for production. Other business units have been GCP for both development and production use cases. You have been asked to provide tools in GCP that can provide recommendations for reducing costs and getting insight into better ways of resource management. What tools in GCP could you identify?

    **Recommender**

    **Commitment Analysis**

    Explicación Every cloud provider has their own approach for billing and cost management. We need to know the three major providers in preparation for the exam. Please refer to this page for a handy table. [Multi-Cloud Tools and Terminology (finops.org)](https://www.finops.org/projects/multi-cloud-tools-and-terminology/)

 47. According to the FinOps Foundation there are very specific roles/personas. For the role of a product owner what would be the 'Primary Goal' ?
    
    **Quickly bring new products and features to market with an accurate price point.**

    Explanation: The product owner is focused on Product Growth and other concerns such as delivering innovative, market leading solutions cost effectively. Products need to get market correctly.

    Reference: Please review this page before the exam [https://www.finops.org/framework/personas/#product-owner](https://www.finops.org/framework/personas/#product-owner)

 48. When proposing the adoption of a FinOps function within an organization, there will be a need to brief a variety of personas among the executive team to gain approval, buy-in, and involvement in conducting FinOps and achieving its goals. Every role has a clearly documented Primary Goal. What is the primary goal for the **Engineering Lead**?
    
    **Deliver faster and high quality services to the organization, whilst maintaining business as usual**

    There are clearly labeled roles for each 'Persona' and we must learn these for the exam.
    
    Reference: [FinOps Personas](https://www.finops.org/framework/personas/)

 49. When proposing the adoption of a FinOps function within an organization, there will be a need to brief a variety of personas among the executive team to gain approval, buy-in, and involvement in conducting FinOps and achieving its goals. Every role has a clearly documented Primary Goal. What is the primary goal for a **Chief Technology Officer (CTO)**
    
    **Leverage technology to give the business a market and competitive advantage**

    There are clearly labeled roles for each 'Persona' and we must learn these for the exam.
    
    Reference: [FinOps Personas](https://www.finops.org/framework/personas/)

 50. Multiple Selection : Which of the following is true regarding teams working in FinOps organizations? (Select two) 
    
    **All teams have a role to play in FinOps**

    **Teams have different motivators that drive spend and savings.**


    Some other basic realities are with FinOps teams are
    
      - Teams need to work together with a balance of empathy for one another’s goals.
      - FinOps practitioners help align teams to organizational goals.
    
      Teams inside your organization are able to work together to understand one another’s goals alongside a centralized FinOps team that is helping to build out reporting and practices to assist everyone in achieving them.

 51. What is the purpose of a FinOps Center of Excellence in an organization?
    
    **To strictly enforce FinOps governance policies and models**
    
    A FinOps Center of Excellence is built around business, technology, financial, and operational stakeholders. It defines the governance policies and models for FinOps, and the rest of the organization follows these guidelines to ensure effective adoption of FinOps practices.

 52. What is the key factor for the successful adoption of Cloud Computing?
    
    **Building a culture of FinOps**

    The successful adoption of Cloud Computing relies on the proper implementation and adoption of the FinOps Framework. Building a culture of FinOps involves having a FinOps Center of Excellence and ensuring that the organization strictly follows the defined governance policies and models.

 53. True or False: FinOps teams primarily focus on managing costs, while innovation and velocity are secondary considerations.
    
    **False**.

    While cost optimization is undoubtedly a core component of FinOps, the statement that FinOps teams prioritize it at the expense of innovation and velocity is inaccurate. In fact, a successful FinOps approach recognizes the need to balance all three aspects:
    
      - Cost optimization: Finding ways to optimize cloud spending without compromising performance or functionality.

      - Innovation: Encouraging teams to explore and adopt new technologies and cloud services that can drive business value.

      - Velocity: Ensuring projects and deployments happen quickly and efficiently without incurring unnecessary costs.
    
    ![q53](images/focp_53.png)
 
 54. What is the primary benefit of OpEx for businesses?
    
    **Reduced hardware and software costs**

    - (a) Reduced hardware and software costs: This is correct because a major benefit of OpEx is the ability to rent instead of purchase technology and infrastructure, leading to cost savings on hardware and software.
    - (b) Elimination of IT staff workload: While OpEx may reduce some burden on IT, it doesn't completely eliminate their work. Managing cloud resources and optimizing costs still requires their expertise.
    - (c) Increased control over IT infrastructure: Moving to the cloud generally involves some loss of control over infrastructure compared to on-premise solutions. While management tools exist, the absolute control of your own hardware isn't present.
    - (d) Faster deployment of new technologies: This may be a secondary benefit of cloud-based OpEx due to its scalability and flexibility.

 55. What does the OpEx ratio measure?
    
    **The efficiency of cloud cost management**

    - (a) The efficiency of cloud cost management: This is correct, the OpEx ratio is a key metric for comparing a company's cloud spending to its revenue, effectively measuring their cost efficiency.
    - (b) The level of IT infrastructure control: While control over infrastructure plays a role in cost management, the OpEx ratio specifically focuses on financial efficiency, not control levels.
    - (c) The return on investment in cloud services: The OpEx ratio compares current spending to revenue, not investments or future returns.
    - (d) The profit margin of a business: The OpEx ratio is a specific metric within OpEx and doesn't directly reflect a company's overall profit margin, which encompasses various factors beyond cloud costs.

 56. What is a challenge associated with managing cloud costs across multiple providers? (Select Two)
    
    **Increased operational complexity**

    **Reduced visibility into spending**

    Reduced visibility into spending. there is a difficulty of understanding costs across multiple clouds, hindering optimization efforts.

    - (a) Increased operational complexity: This is correct because managing resources across multiple cloud providers can be challenging, requiring additional tools, processes, and expertise to maintain visibility and control, hence increasing operational complexity.
    - (b) Reduced visibility into spending: This is also correct as the passage mentions the difficulty of understanding costs across multiple providers, making it harder to analyze and optimize spending.

 57. How can FinOps help prevent cloud cost spikes?
    
    **By setting spending limits and alerts**

    This is correct because It highlights the importance of proactive monitoring and alerts to prevent unforeseen cost spikes. FinOps teams often leverage tools and dashboards to set spending thresholds and trigger alerts that prevent excessive spending.

 58. True or False : FinOps aims to balance cost management with business agility and innovation, ensuring that cost-consciousness aligns with overall business goals.
    
    **True**

    ![q58](images/focp_58.png)

 59. What does FinOps represent?

    **Financial Operations, more commonly referenced as FinOps, represent the intersection of Finance, DevOps, and Business.**

    Here's why:
    
    - FinOps focuses on managing and optimizing cloud costs: HR doesn't typically play a direct role in this process, while DevOps teams have significant involvement in cloud resource utilization and cost drivers.
     
    - Collaboration between Finance, DevOps, and Business is crucial: This collaboration ensures informed decision-making regarding cloud investments, balancing cost optimization with business value and agility needs.
     
    - Marketing doesn't directly manage cloud resources: While Marketing might benefit from cloud technologies, they're generally not involved in optimizing their infrastructure costs.
    
    Therefore, FinOps primarily operates at the intersection of Finance, DevOps, and Business, where the focus lies on:
    
    - Finance: Provides financial expertise, budgeting, and cost visibility.
     
    - DevOps: Understands cloud resource usage, identifies optimization opportunities, and implements efficient practices.

    - Business: Sets strategic goals, prioritizes initiatives, and aligns cloud investments with business objectives.
    
    By fostering collaboration and shared responsibility across these stakeholders, FinOps empowers organizations to optimize cloud costs, maximize value, and achieve sustainable cloud growth.
    
    Remember, FinOps is more than just cost reduction. It's about driving responsible and value-driven cloud adoption that benefits the entire organization.
    
    Reference: [https://www.finops.org/introduction/what-is-finops/](https://www.finops.org/introduction/what-is-finops/) 

 60. What is the role of cloud management tools in OpEx management?
    
    **They help keep things in check and manage cloud resources effectively.**

    Here's why the other options are incorrect:

    - a. They eliminate the need for FinOps teams: Cloud management tools are powerful, but they cannot replace the expertise and strategic role of FinOps teams. These teams still need to analyze data, set goals, and make decisions based on the insights provided by the tools.
    - b. They provide complete control over IT infrastructure: While cloud management tools offer greater visibility and control than simply relying on the cloud provider's interface, they don't offer complete control over the underlying infrastructure. The level of control depends on the specific tool and cloud provider.
    - d. They only focus on financial benchmarks: Cloud management tools offer a wider range of features beyond just financial data. They can track resource utilization, security, performance, and compliance, providing a holistic view of cloud resources.
    
    Therefore, cloud management tools act as valuable assistants to FinOps teams, helping them monitor, analyze, and optimize cloud resources for cost-effectiveness and overall efficiency. They automate tasks, provide alerts, and generate reports, making it easier to manage large and complex cloud environments.
    
    Remember, FinOps is the broader strategy and framework, while cloud management tools are the technical instruments that support its implementation.

 61. Why is it essential for business leaders to analyze budgets and financial benchmarks when moving to cloud-based OpEx offerings?
    
    **To ensure long-term savings despite some upfront costs**

    Here's why the other options are incorrect:

    - a. To increase employee salaries: Although cost optimization often leads to increased profitability, which might allow for employee raises, that's not the primary focus when analyzing budgets and benchmarks for cloud migrations.
    - b. To eliminate all risks associated with on-premise infrastructure: Moving to the cloud doesn't completely eliminate all risks associated with on-premise infrastructure. There are still cloud-specific risks and considerations.
    - d. To completely avoid the need for cloud cost management: Even with apparent long-term savings, cloud cost management remains crucial. Analyzing budgets and benchmarks helps anticipate the upfront costs and ongoing expenses to effectively manage spending and optimize your cloud investment.
    
    Therefore, analyzing budgets and financial benchmarks ensures that the potential long-term savings from cloud-based OpEx outweigh the initial costs and ongoing expenses. This analysis helps business leaders make informed decisions about resource allocation, pricing models, and optimization strategies to maximize the cloud's cost-effectiveness for their business.
    
    Remember, even though the cloud promises flexibility and scalability, proper financial planning and management are still essential for a successful cloud migration and cost optimization journey.

 62. What role does cloud health monitoring play in FinOps?
    
    **It provides insights into cloud consumption.**

    Here's why the other options are incorrect:

    - a. It ensures complete control over IT infrastructure: While cloud health monitoring offers increased visibility and control compared to purely relying on the cloud provider's interface, it doesn't guarantee complete control over the underlying infrastructure. The level of control still depends on the tools and the specific cloud provider.
    - c. It eliminates the need for cloud management tools: Cloud health monitoring is actually a core function of many cloud management tools. While monitoring provides valuable insights, tools offer additional features like automation, alerts, and reporting, making them crucial for comprehensive FinOps strategies.
    - d. It focuses solely on financial benchmarks: While monitoring data can be used to track costs and optimize expenditure, its role in FinOps extends beyond just financial aspects. Cloud health monitoring also provides insights into resource utilization, performance, security, and compliance, offering a holistic view of your cloud environment's health and efficiency.
    
    Therefore, cloud health monitoring plays a vital role in FinOps by providing valuable data and insights into your cloud consumption. This information empowers FinOps teams to:
    
    * Identify areas for optimization and cost reduction.
    * Improve resource utilization and prevent waste.
    * Track performance and detect potential issues.
    * Ensure compliance and secure your cloud environment.
    
    Overall, cloud health monitoring serves as a critical diagnostic tool for FinOps teams, enabling them to make informed decisions and optimize your cloud investment for cost-effectiveness, performance, and overall health.
 63. What is the purpose of tagging in cloud cost management?
    
    **To provide metadata for individual resources.**

    Here's why the other options are incorrect:

    - a. To eliminate the need for cost allocation strategies: While tagging can facilitate cost allocation, it doesn't eliminate the need for strategies entirely. You still need to determine how costs are attributed to different tags and define relevant groupings for analysis.
    - b. To organize tags based on hierarchy groupings: Tag hierarchies can be helpful, but the primary purpose of tagging is not to create hierarchies. Tags are primarily used to tag individual resources with relevant information.
    - d. To enforce compliance with cloud service provider policies: While tags can be used to track compliance with some policies, this is not their primary purpose. Tags are primarily used for cost management and resource organization.
    
    Therefore, the main purpose of tagging in cloud cost management is to add descriptive metadata to individual resources. This metadata can include information such as:
    
    * Project name
    * Team or department
    * Environment (e.g., production, development, testing)
    * Application name
    * Owner or contact information
    
    This metadata allows you to:
    
    * Track costs by category: By tagging resources with relevant categories, you can easily analyze your cloud spend and identify areas for optimization.
    * Allocate costs to different teams or departments: Tags can be used to attribute costs to individual teams or departments, making it easier to track their cloud usage and budget allocations.
    * Filter and group resources: Tags can be used to filter and group resources based on specific criteria, making it easier to manage and troubleshoot your cloud environment.
    * Automate tasks: Some cloud platforms allow you to automate tasks based on tags, such as sending cost alerts or decommissioning unused resources.
    
    Overall, tagging plays a crucial role in effective cloud cost management by providing a detailed and flexible way to organize and analyze your cloud resources. By using tags strategically, you can gain valuable insights into your cloud usage and make informed decisions to optimize your spending and improve your cloud efficiency.
 
 64. What are the primary categories of tags used in cost allocation for chargeback or showback?
    
    **Business Tags, Environment Tags, and Automation Tags.**

    Here's why:
    
    - Business Tags: These are crucial for identifying the business unit, department, or project responsible for the cloud resources' costs. Examples include project names, product lines, or business units.
    - Environment Tags: These categorize resources based on their purpose (e.g., production, development, testing) or specific configurations. This helps understand cloud usage across different environments and allocate costs accordingly.
    - Automation Tags: While not directly related to cost allocation, these tags enable automation of cost-related tasks based on resource attributes. For example, automatically decommissioning idle resources tagged for "testing" after a certain period.
    
    Other options:
    
    * a. Business Tags, Security Tags, and Compliance Tags: While Security and Compliance are important categories, they wouldn't necessarily be primary for cost allocation. They might be used for tracking resource configurations for compliance purposes, but wouldn't directly map to cost attribution.
    * c. Compliance Tags, Automation Tags, and Business Owner Tags: "Business Owner Tags" might be relevant for specific scenarios, but generally, Business Tags encompass broader ownership information. Compliance tags wouldn't be primary for cost allocation as explained earlier.
    * d. Name Tags, Encryption Tags, and Cost Center Tags: "Name Tags" are simply descriptive labels and wouldn't be meaningful for cost allocation. Encryption tags might be relevant for specific security needs but not directly related to cost attribution. "Cost Center Tags" could overlap with Business Tags depending on the organization's structure.
    
    Therefore, while the specific tag categories may vary based on individual organizational needs, Business Tags, Environment Tags, and Automation Tags are the most likely primary categories used in cost allocation for chargeback or showback due to their direct relevance to resource ownership, usage, and cost attribution.
    
    Remember, effective tagging requires a thoughtful and consistent approach to ensure accurate and insightful cost allocation for chargeback or showback purposes.
 
 65. Why is it recommended to assign tags as close to the resource and source data as possible?

    **To allow tags to flow with cost and usage data to downstream systems.**

    Here's why the other options are incorrect:
    
    - a. To minimize the number of tags needed: While minimizing tag clutter is advisable, assigning tags close to the source doesn't automatically guarantee minimizing the number of tags. It actually enables more granular and accurate cost allocation.
    - b. To ensure compliance with cloud service provider policies: Tagging can facilitate compliance with certain policies, but compliance isn't the primary reason for this recommendation.
    - c. To guarantee complete control over IT infrastructure: Tagging offers increased visibility and control, but it doesn't guarantee complete control over the underlying infrastructure.
    
    Therefore, the primary reason for assigning tags as close to the resource and source data as possible is to ensure that the tags seamlessly flow with the associated cost and usage data throughout your internal systems. This flow is crucial for:
    
    * Accurate cost allocation: By inheriting resource tags, downstream systems like cost management platforms can accurately assign costs to the relevant business units, projects, or departments.
    * Granular analysis: Tags closer to the source enable fine-grained analysis of resources and their associated costs, providing deeper insights into cloud usage patterns and potential optimization opportunities.
    * Automated cost tracking: When tags flow automatically with cost data, downstream systems can trigger automated actions based on predefined tag-based cost thresholds, improving cost control and efficiency.
    
    Overall, assigning tags close to the resource and source data fosters a cohesive and integrated cloud cost management ecosystem. This tight integration allows for accurate cost attribution, deeper analysis, and automated cost control, ultimately leading to optimized cloud spend and improved financial transparency.
    
    Remember, strategic tagging and efficient data flow are essential pillars for effective cloud cost management and FinOps practices.
 
 66. Why is it crucial for on-premise teams and cloud teams to use the same unit of measure when comparing infrastructure services?

    **To ensure fair and accurate cost comparison.**

    Here's why the other options are incorrect:

    - a. To make cloud services seem more expensive: This is misleading. Using the same unit of measure actually promotes transparency and facilitates objective cost comparisons.
    - b. To prevent accurate cost comparison between on-premise and cloud services: This is the opposite of the actual goal. Standardizing the unit of measure allows for apples-to-apples comparisons and informed decision-making.
    - d. To discourage organizations from moving to the cloud: This doesn't align with the benefits of adopting a unified unit of measure. It enables organizations to assess the true cost-effectiveness of different options, including cloud alternatives.
    
    Therefore, using the same unit of measure is crucial because it provides a fair and consistent basis for comparing the costs of on-premise and cloud infrastructure services. This facilitates:
    
    * Informed decision-making: By accurately understanding the true cost of both options, organizations can make informed choices about migrating or expanding their cloud presence.
    * Budget allocation and planning: Standardized cost metrics enable consistent budgeting and financial planning across both on-premise and cloud environments.
    * Cost transparency and accountability: Consistent units help track and compare costs effectively, promoting transparency and accountability within the organization.
    
    Common units of measure used for comparing infrastructure services include:
    
    * Cost per core-hour: This measures the cost of using a CPU core for a specific period.
    * Cost per gigabyte-month: This measures the cost of storing data for a specific period.
    * Cost per network transfer: This measures the cost of transferring data across the network.
    
    Using a standardized unit of measure is recommended best practice for cloud cost management and FinOps principles. It fosters transparency, objectivity, and informed decision-making when evaluating and comparing different infrastructure options, empowering organizations to optimize their cloud spend and maximize the value of their cloud investments. 

 67. True or False: Visibility into cloud spend allows investigating trends and building forecasts for future costs in FinOps. 
    
    **True**

    Explicación: Visibility into cloud spend is essential for investigating trends, building forecasts, and making informed decisions about future costs in FinOps.
 
 68. How can a FinOps practitioner address resources that are not tagged?
    
    **Enforce tagging via cloud service provider capabilities.**

    Here's why the other options are less preferable:

    - b. Rely solely on 3rd party cost allocation systems: While third-party cost allocation tools can offer valuable insights and automation, they still rely on accurate and consistent tagging data for effective attribution. Ignoring untagged resources completely would lead to inaccurate cost visibility and hinder optimization efforts.
    - c. Ignore untagged resources for cost allocation: This completely neglects the costs associated with untagged resources, leading to inaccurate financial reporting and potential waste. It's crucial to address and allocate costs for all resources used, even if untagged.
    - d. Apply peer pressure on cloud service providers: While advocating for improved tagging features with cloud providers is valid, it's not a direct solution for addressing immediate untagged resources and their associated costs.
    
    Therefore, the most proactive approach is to utilize the tagging enforcement capabilities offered by most cloud service providers. These features allow FinOps practitioners to:
    
    * Set mandatory tagging requirements: You can define specific tags that must be applied to all resources before they can be deployed.
    * Trigger alerts for untagged resources: Monitor for newly created resources and proactively identify any that are missing tags.
    * Enforce cost allocation rules for untagged resources: Implement pre-defined rules to attribute costs for untagged resources to specific categories or departments based on resource type or other available information.
    
    Additionally, FinOps practitioners can:
    
    * Educate and incentivize developers and cloud users: Promote the importance of proper tagging and the consequences of leaving resources untagged.
    * Automate tagging solutions: Utilize tools or scripts to automatically apply tags based on resource attributes or usage patterns.
    * Regularly audit and refine tagging practices: Continuously review tagging effectiveness, identify improvement opportunities, and adapt the strategy as needed.
    
    By actively addressing untagged resources and enforcing a strong tagging culture, FinOps practitioners can ensure accurate cost allocation, optimize cloud expenses, and gain valuable insights into resource utilization for informed decision-making.

 69. Which stakeholders are involved in developing a robust cost allocation methodology?
    
    **Engineering, Finance, and Executives.**

    Here's why the other options are less likely:

    - a. Finance and Compliance teams: While Finance is crucial for cost allocation, Compliance usually focuses on regulations and data security, not cost attribution models.
    - c. Business Owners and Security teams: Although Business Owners can provide input on cost distribution preferences, security teams wouldn't typically lead the development of the methodology itself.
    - d. Cloud Service Providers and 3rd party vendors: While cloud providers offer tagging functionalities and third-party tools can provide insights, they wouldn't spearhead the internal development of an organization's specific cost allocation methodology.
    
    Engineering teams bring technical expertise and understand the resource dependencies and utilization patterns. Finance teams possess accounting knowledge and ensure cost allocation principles are sound and align with financial reporting requirements. Executives provide strategic direction and set budget constraints, ultimately approving the adopted methodology.
    
    Collaboration between these key stakeholders is crucial for developing a robust cost allocation methodology that:
    
    * Reflects the organization's specific needs and structure.
    * Balances fairness and accuracy in cost attribution.
    * Aligns with technical feasibility and data availability.
    * Supports clear communication and transparency across departments.
    
    Effective cost allocation methodologies enable informed decision-making, optimize resource utilization, and promote cloud cost accountability within an organization.

 70. What are the reasons for starting FinOps practices early in an organization? (Select three)
    
    **To quickly reduce the cloud bill** 

    **To achieve better visibility and make informed decisions**

    **To ensure compliance with industry benchmarks**
    
    The following are reasons to start FinOps practices early in an organization

    - A. To quickly reduce the cloud bill: True. Implementing FinOps practices like cost optimization, resource management, and budgeting can help identify and eliminate cloud waste, leading to cost reductions early on.
    - C. To achieve better visibility and make informed decisions: True. Early FinOps practices provide better insights into cloud spend patterns, resource usage, and potential cost drivers. This data empowers informed decisions about resource allocation, pricing models, and optimization strategies.
    - D. To ensure compliance with industry benchmarks: True. While not the primary goal, early FinOps can help establish best practices and align cloud usage with industry standards, indirectly contributing to compliance.
    
    -----------------------------------------------------------------------------------------------------------------
    
    * B. To avoid any executive interventions: False. While early FinOps can lead to smoother scaling and resource allocation, avoiding executive involvement is not a healthy goal. FinOps should involve collaboration with leadership to ensure aligned goals and resource prioritization.
    * E. To promote misunderstandings among teams: False. This is the opposite of the desired outcome. FinOps promotes collaboration and communication between finance, operations, development, and business teams to achieve shared goals.
    * F. To establish complex financial models: False. Early FinOps should start with simple and actionable practices. Complex financial models can be introduced later as the organization matures in its FinOps journey.
    
    Therefore, the correct answers are A, C, and D. Starting FinOps early allows organizations to gain better control over cloud spending, make informed decisions based on data, and potentially align with industry best practices. It's not about avoiding leadership involvement, promoting team conflict, or establishing overly complex financial models right away.