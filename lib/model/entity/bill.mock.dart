import 'package:law_in_people_hand/model/api.dart';
import 'bill.dart';

const mockVotedBillList = '''
[
    {
        "bill": {
            "billId": "PRC_B2B0N1Q2V2S2M1T0I0H1D4F4O5G1B4",
            "billNo": 2106844,
            "age": 21,
            "billName": "조세특례제한법 일부개정법률안",
            "proposer": "전용기의원 등 14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700300",
            "currCommittee": "기획재정위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_B2B0N1Q2V2S2M1T0I0H1D4F4O5G1B4",
            "procResultCode": "대안반영폐기",
            "procDate": "2021-02-26",
            "stage": "SUBSTITUTED_DISPOSAL",
            "overview": "제안이유 및 주요내용 코로나-19의 재확산으로 인하여 소상공인·자영업자들이 다시금 막대한 경제적 타격을 받고 있음. 최근 소상공인연합회에 따르면 자영업자 영업비용 중 가장 큰 부담이 되는 항목을 임대료로 들었음. 영업이 어려운 상황에서 영업 여부와 관계없이 지속적으로 지출되는 임대료 부담에 대한 자영업자들의 호소에 부응하여 정부는 임대차사업자가 임대료를 인하할 경우 한시적으로 소득세 또는 법인세를 일정 부분 공제해주는 세제혜택을 마련한 바 있음. 현행법상 세액공제 혜택은 임대료 인하액의 50%를 한도로 정하고 있으나 임대인의 참여를 유도하기엔 부족하여 ‘착한 임대인’ 운동을 참여 독려를 위해서는 추가적인 세제 지원이 필요하다는 지적이 있음. 이에 상가임대차사업자가 임대료를 인하하는 경우 세액공제 비율을 임대료 인하액의 50%에서 70%로 확대하고, 세액공제 기간을 2020년 6월 30일에서 2021년 12월 31일까지 연장함으로써 자영업자의 임대료 안정에 기여하려는 것임(안 제96조의3)."
        },
        "totalCount": 1,
        "agreeCount": 1,
        "disagreeCount": 0
    },
    {
        "bill": {
            "billId": "PRC_F2K0L1L2I1F8U1L3K0M4D0J9M7Z3W9",
            "billNo": 2106846,
            "age": 21,
            "billName": "여신전문금융업법 일부개정법률안",
            "proposer": "전용기의원등14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700008",
            "currCommittee": "정무위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_F2K0L1L2I1F8U1L3K0M4D0J9M7Z3W9",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 코로나-19의 재확산으로 인하여 소상공인·자영업자들이 다시금 막대한 경제적 타격을 받고 있음. 최근 소상공인연합회에 따르면 자영업자 영업비용 중 가장 큰 부담이 되는 항목을 임대료로 들었음. 영업이 어려운 상황에서 영업 여부와 관계없이 지속적으로 지출되는 임대료 부담에 대한 자영업자들의 호소에 부응하여, 정부는 임대차사업자가 임대료를 인하할 경우에 대한 세제혜택을 마련한 바 있음. 한편, 상가임대료를 인하하여 지급받은 이른바 ‘착한 임대인’에 대하여 세액공제를 하는 것만으로는 실효성이 부족하여 ‘착한 임대인’ 운동 참여를 독려할 추가적인 지원이 필요하다는 지적이 있음. 특히 상가임대사업자가 임차인에 대해 임대료를 인하해주더라도 부동산 매입 등에 대한 대출 금리는 그대로 유지되어 금융비용에 대한 부담이 될 수 있음. 이에 상가임대차사업자가 소상공인에 대하여 상가임대료를 인하하여 지급받는 경우 이에 맞추어 금융기관에 금리인하를 요구할 수 있는 근거를 마련함으로써 상가임대인의 임대료 인하를 독려하고 소상공인의 영업 안정에 기여하려는 것임(안 제50조의14 신설)."
        },
        "totalCount": 1,
        "agreeCount": 1,
        "disagreeCount": 0
    },
    {
        "bill": {
            "billId": "PRC_Y2C0I1V2E1S4P1H5I5R4Q0R3I1A2P9",
            "billNo": 2106843,
            "age": 21,
            "billName": "저작권법 일부개정법률안",
            "proposer": "이상헌의원 등 11인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700513",
            "currCommittee": "문화체육관광위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_Y2C0I1V2E1S4P1H5I5R4Q0R3I1A2P9",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 현행법은 저작자의 권리와 이에 인접하는 권리를 보호하고 저작물의 공정한 이용을 도모함으로써 문화 및 관련 산업의 향상발전에 이바지함을 목적으로 하고 있으나, 최근 급속한 디지털 환경 변화로 인하여 방송과 인터넷 미디어 서비스(OTT 등)와의 경계가 모호해진 상황을 반영하고 있지 않아 사업자간 명확한 해석이 불분명해지는 등의 시장의 혼란을 초래하고 있음. 방송 환경의 특성을 감안해 일괄적으로 권리 처리가 가능한 방송 보상금 제도가 시행되고 있으나, 방송 후 24시간 내 동일한 콘텐츠가 서비스되는 인터넷 미디어 유통서비스(OTT)의 경우 법률상 정의가 모호하다는 이유로 관련 제도 대상에 포함되지 않고 있음. 이는 음원의 유통 규모와 방식에 대하여 인터넷 미디어 유통서비스와 방송과의 차이가 없음에도 불구하고, 음원에 대한 권리 처리 방식이 상이하게 규정되어 있거나 적합한 규정 마련이 부재한 상황에 따라 미디어 콘텐츠 제작사의 저작물에 대한 공정한 이용 행위를 저해하고 있는 것임. 또한 음반 제작자 및 실연자 등 저작권리자의 정당한 권리 보호라는 동 제도의 취지가 실현되지 못하는 규제 공백의 문제도 지속적으로 발생되고 있음. 한편, 최근 미디어 유통 및 소비에 있어 디지털 환경으로의 변화가 가속화되고 있는 상황을 반영하고 향후 발생할 수 있는 산업 내 분쟁 가능성을 최소화함으로써 저작권리에 대한 공정의 원칙 실현과 소비자의 이용후생을 도모할 수 있도록 관련 규정 정비가 필요함. 이에 음악실연자와 음악제작자에 대한 전송보상청구권 제도를 도입하고 관련 사항을 법률로써 명확하게 정의하도록 함으로써 현행법의 불명확성을 개선ㆍ보완하여 방송과 인터넷 미디어 유통서비스 간 차별적 행위를 해소하여 관련 산업의 균형적 발전을 도모하려는 것임(안 제75조제1항 및 제82조제1항)."
        },
        "totalCount": 1,
        "agreeCount": 1,
        "disagreeCount": 0
    }
]
''';

const mockSeenBillList = '''
[
    {
        "bill": {
            "billId": "PRC_Y2C0I1V2E1S4P1H5I5R4Q0R3I1A2P9",
            "billNo": 2106843,
            "age": 21,
            "billName": "저작권법 일부개정법률안",
            "proposer": "이상헌의원 등 11인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700513",
            "currCommittee": "문화체육관광위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_Y2C0I1V2E1S4P1H5I5R4Q0R3I1A2P9",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 현행법은 저작자의 권리와 이에 인접하는 권리를 보호하고 저작물의 공정한 이용을 도모함으로써 문화 및 관련 산업의 향상발전에 이바지함을 목적으로 하고 있으나, 최근 급속한 디지털 환경 변화로 인하여 방송과 인터넷 미디어 서비스(OTT 등)와의 경계가 모호해진 상황을 반영하고 있지 않아 사업자간 명확한 해석이 불분명해지는 등의 시장의 혼란을 초래하고 있음. 방송 환경의 특성을 감안해 일괄적으로 권리 처리가 가능한 방송 보상금 제도가 시행되고 있으나, 방송 후 24시간 내 동일한 콘텐츠가 서비스되는 인터넷 미디어 유통서비스(OTT)의 경우 법률상 정의가 모호하다는 이유로 관련 제도 대상에 포함되지 않고 있음. 이는 음원의 유통 규모와 방식에 대하여 인터넷 미디어 유통서비스와 방송과의 차이가 없음에도 불구하고, 음원에 대한 권리 처리 방식이 상이하게 규정되어 있거나 적합한 규정 마련이 부재한 상황에 따라 미디어 콘텐츠 제작사의 저작물에 대한 공정한 이용 행위를 저해하고 있는 것임. 또한 음반 제작자 및 실연자 등 저작권리자의 정당한 권리 보호라는 동 제도의 취지가 실현되지 못하는 규제 공백의 문제도 지속적으로 발생되고 있음. 한편, 최근 미디어 유통 및 소비에 있어 디지털 환경으로의 변화가 가속화되고 있는 상황을 반영하고 향후 발생할 수 있는 산업 내 분쟁 가능성을 최소화함으로써 저작권리에 대한 공정의 원칙 실현과 소비자의 이용후생을 도모할 수 있도록 관련 규정 정비가 필요함. 이에 음악실연자와 음악제작자에 대한 전송보상청구권 제도를 도입하고 관련 사항을 법률로써 명확하게 정의하도록 함으로써 현행법의 불명확성을 개선ㆍ보완하여 방송과 인터넷 미디어 유통서비스 간 차별적 행위를 해소하여 관련 산업의 균형적 발전을 도모하려는 것임(안 제75조제1항 및 제82조제1항)."
        },
        "totalCount": 1
    }
]
''';

const mockBillList = '''
{
    "content": [
        {
            "billId": "PRC_Y2C0I1V2E1S4P1H5I5R4Q0R3I1A2P9",
            "billNo": 2106843,
            "age": 21,
            "billName": "저작권법 일부개정법률안",
            "proposer": "이상헌의원 등 11인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700513",
            "currCommittee": "문화체육관광위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_Y2C0I1V2E1S4P1H5I5R4Q0R3I1A2P9",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 현행법은 저작자의 권리와 이에 인접하는 권리를 보호하고 저작물의 공정한 이용을 도모함으로써 문화 및 관련 산업의 향상발전에 이바지함을 목적으로 하고 있으나, 최근 급속한 디지털 환경 변화로 인하여 방송과 인터넷 미디어 서비스(OTT 등)와의 경계가 모호해진 상황을 반영하고 있지 않아 사업자간 명확한 해석이 불분명해지는 등의 시장의 혼란을 초래하고 있음. 방송 환경의 특성을 감안해 일괄적으로 권리 처리가 가능한 방송 보상금 제도가 시행되고 있으나, 방송 후 24시간 내 동일한 콘텐츠가 서비스되는 인터넷 미디어 유통서비스(OTT)의 경우 법률상 정의가 모호하다는 이유로 관련 제도 대상에 포함되지 않고 있음. 이는 음원의 유통 규모와 방식에 대하여 인터넷 미디어 유통서비스와 방송과의 차이가 없음에도 불구하고, 음원에 대한 권리 처리 방식이 상이하게 규정되어 있거나 적합한 규정 마련이 부재한 상황에 따라 미디어 콘텐츠 제작사의 저작물에 대한 공정한 이용 행위를 저해하고 있는 것임. 또한 음반 제작자 및 실연자 등 저작권리자의 정당한 권리 보호라는 동 제도의 취지가 실현되지 못하는 규제 공백의 문제도 지속적으로 발생되고 있음. 한편, 최근 미디어 유통 및 소비에 있어 디지털 환경으로의 변화가 가속화되고 있는 상황을 반영하고 향후 발생할 수 있는 산업 내 분쟁 가능성을 최소화함으로써 저작권리에 대한 공정의 원칙 실현과 소비자의 이용후생을 도모할 수 있도록 관련 규정 정비가 필요함. 이에 음악실연자와 음악제작자에 대한 전송보상청구권 제도를 도입하고 관련 사항을 법률로써 명확하게 정의하도록 함으로써 현행법의 불명확성을 개선ㆍ보완하여 방송과 인터넷 미디어 유통서비스 간 차별적 행위를 해소하여 관련 산업의 균형적 발전을 도모하려는 것임(안 제75조제1항 및 제82조제1항)."
        },
        {
            "billId": "PRC_B2B0N1Q2V2S2M1T0I0H1D4F4O5G1B4",
            "billNo": 2106844,
            "age": 21,
            "billName": "조세특례제한법 일부개정법률안",
            "proposer": "전용기의원 등 14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700300",
            "currCommittee": "기획재정위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_B2B0N1Q2V2S2M1T0I0H1D4F4O5G1B4",
            "procResultCode": "대안반영폐기",
            "procDate": "2021-02-26",
            "stage": "SUBSTITUTED_DISPOSAL",
            "overview": "제안이유 및 주요내용 코로나-19의 재확산으로 인하여 소상공인·자영업자들이 다시금 막대한 경제적 타격을 받고 있음. 최근 소상공인연합회에 따르면 자영업자 영업비용 중 가장 큰 부담이 되는 항목을 임대료로 들었음. 영업이 어려운 상황에서 영업 여부와 관계없이 지속적으로 지출되는 임대료 부담에 대한 자영업자들의 호소에 부응하여 정부는 임대차사업자가 임대료를 인하할 경우 한시적으로 소득세 또는 법인세를 일정 부분 공제해주는 세제혜택을 마련한 바 있음. 현행법상 세액공제 혜택은 임대료 인하액의 50%를 한도로 정하고 있으나 임대인의 참여를 유도하기엔 부족하여 ‘착한 임대인’ 운동을 참여 독려를 위해서는 추가적인 세제 지원이 필요하다는 지적이 있음. 이에 상가임대차사업자가 임대료를 인하하는 경우 세액공제 비율을 임대료 인하액의 50%에서 70%로 확대하고, 세액공제 기간을 2020년 6월 30일에서 2021년 12월 31일까지 연장함으로써 자영업자의 임대료 안정에 기여하려는 것임(안 제96조의3)."
        },
        {
            "billId": "PRC_F2K0L1L2I1F8U1L3K0M4D0J9M7Z3W9",
            "billNo": 2106846,
            "age": 21,
            "billName": "여신전문금융업법 일부개정법률안",
            "proposer": "전용기의원등14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700008",
            "currCommittee": "정무위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_F2K0L1L2I1F8U1L3K0M4D0J9M7Z3W9",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 코로나-19의 재확산으로 인하여 소상공인·자영업자들이 다시금 막대한 경제적 타격을 받고 있음. 최근 소상공인연합회에 따르면 자영업자 영업비용 중 가장 큰 부담이 되는 항목을 임대료로 들었음. 영업이 어려운 상황에서 영업 여부와 관계없이 지속적으로 지출되는 임대료 부담에 대한 자영업자들의 호소에 부응하여, 정부는 임대차사업자가 임대료를 인하할 경우에 대한 세제혜택을 마련한 바 있음. 한편, 상가임대료를 인하하여 지급받은 이른바 ‘착한 임대인’에 대하여 세액공제를 하는 것만으로는 실효성이 부족하여 ‘착한 임대인’ 운동 참여를 독려할 추가적인 지원이 필요하다는 지적이 있음. 특히 상가임대사업자가 임차인에 대해 임대료를 인하해주더라도 부동산 매입 등에 대한 대출 금리는 그대로 유지되어 금융비용에 대한 부담이 될 수 있음. 이에 상가임대차사업자가 소상공인에 대하여 상가임대료를 인하하여 지급받는 경우 이에 맞추어 금융기관에 금리인하를 요구할 수 있는 근거를 마련함으로써 상가임대인의 임대료 인하를 독려하고 소상공인의 영업 안정에 기여하려는 것임(안 제50조의14 신설)."
        },
        {
            "billId": "PRC_F2Y0U1K2I1C8R1G3J0D3O1M9K0V7O6",
            "billNo": 2106847,
            "age": 21,
            "billName": "은행법 일부개정법률안",
            "proposer": "전용기의원 등 14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-22",
            "currCommitteeId": "9700008",
            "currCommittee": "정무위원회",
            "committeeDate": "2020-12-23",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_F2Y0U1K2I1C8R1G3J0D3O1M9K0V7O6",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 코로나-19의 재확산으로 인하여 소상공인·자영업자들이 다시금 막대한 경제적 타격을 받고 있음. 최근 소상공인연합회에 따르면 자영업자 영업비용 중 가장 큰 부담이 되는 항목을 임대료로 들었음. 영업이 어려운 상황에서 영업 여부와 관계없이 지속적으로 지출되는 임대료 부담에 대한 자영업자들의 호소에 부응하여, 정부는 임대차사업자가 임대료를 인하할 경우에 대한 세제혜택을 마련한 바 있음. 한편, 상가임대료를 인하하여 지급받은 이른바 ‘착한 임대인’에 대하여 세액공제를 하는 것만으로는 실효성이 부족하여 ‘착한 임대인’ 운동 참여를 독려할 추가적인 지원이 필요하다는 지적이 있음. 특히 상가임대사업자가 임차인에 대해 임대료를 인하해주더라도 부동산 매입 등에 대한 대출 금리는 그대로 유지되어 금융비용에 대한 부담이 될 수 있음. 이에 상가임대차사업자가 소상공인에 대하여 상가임대료를 인하하여 지급받는 경우 이에 맞추어 금융기관에 금리인하를 요구할 수 있는 근거를 마련함으로써 상가임대인의 임대료 인하를 독려하고 소상공인의 영업 안정에 기여하려는 것임(안 제30조의3 신설)."
        },
        {
            "billId": "PRC_F1L9F0R3R1O1L1J7A2T3X3X7M6M6C5",
            "billNo": 2019111,
            "age": 20,
            "billName": "한국과학기술원법 일부개정법률안",
            "proposer": "신용현의원 등 13인",
            "proposerKind": "의원",
            "proposeDate": "2019-03-11",
            "currCommitteeId": "9700479",
            "currCommittee": "과학기술정보방송통신위원회",
            "committeeDate": "2019-03-12",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_F1L9F0R3R1O1L1J7A2T3X3X7M6M6C5",
            "procResultCode": "수정가결",
            "procDate": "2019-08-02",
            "stage": "PROMULGATION",
            "overview": "제안이유 및 주요내용 최근 국공립대학교 여성 교수 비율을 25%이상 확대하도록 권고하는 「교육공무원법」이 소관 상임위를 통과하여 법제화를 앞두고 있음. 그런데, 한국과학기술원의 경우 여성 교수 비율이 10% 수준으로 국공립대학교보다 훨씬 낮은 수준임에도 불구하고 「고등교육법」상 대학에 포함되지 아니하여 현행법도 이에 맞추어 개정하여야 한다는 지적이 있음. 이에 한국과학기술원으로 하여금 교원의 임용에서 양성평등을 위해 필요한 정책을 수립·시행하고, 총장이 교원을 임용할 때 특정 성별에 편중되지 않도록 임용계획을 수립하여 시행하도록 하며 과학기술정보통신부장관이 그 추진 실적을 평가하여 행정적·재정적 지원을 할 수 있는 근거 등을 마련함으로써 한국과학기술원의 교원 임용에 있어서 실질적인 양성평등이 이루어질 수 있도록 하려는 것임(안 제15조의4 신설)."
        },
        {
            "billId": "PRC_M2Z0D1D2A2E3B0H9E1Y8J3B3I6S9G4",
            "billNo": 2106848,
            "age": 21,
            "billName": "중소기업기술 보호 지원에 관한 법률 일부개정법률안",
            "proposer": "신정훈의원 등 13인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-23",
            "currCommitteeId": "9700481",
            "currCommittee": "산업통상자원중소벤처기업위원회",
            "committeeDate": "2020-12-24",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_M2Z0D1D2A2E3B0H9E1Y8J3B3I6S9G4",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 중소기업기술 침해 피해가 끊이지 않으면서 지난 5년간 피해 금액만 4,000억원에 이를 정도로 심각하나, 대부분의 중소기업은 피해가 발생하더라도 기술 침해사실 입증의 어려움 및 소송비용의 부담 등으로 소송을 포기하는 사례가 늘고 있음. 덧붙여 2018년 이 법 개정으로 기술 침해에 대한 행정조사제도를 도입하여 중소기업기술에 대한 보호를 강화하였으나 침해자가 조사에 불응 시 이를 강제할 수 없는 한계가 존재하고, 이행명령과 그 위반 시 벌칙에 관한 규정이 없어 실효성이 의문시되고 있음. 이에 자료제출명령제도 개선, 자료제출 불이행 시 이행강제금 부과 및 기술침해대응자문단의 구성ㆍ운영 등을 규정함으로써 기술 침해 행정조사제도의 실효성을 확보하는 한편 기술 침해행위로부터 중소기업을 두텁게 보호하려는 것임. 주요내용 가. 중소벤처기업부장관은 기술 침해 관련 자료를 가진 자가 자료제출을 거부할 정당한 사유가 있다고 주장하는 경우 자료를 가진 자와 기술 침해 신고자 간에 자료에 관하여 질문ㆍ답변하게 할 수 있도록 함(안 제8조의2제6항 신설). 나. 기술 침해행위와 관련된 사안의 객관적이고 공정한 판단을 위해 변호사, 변리사 등으로 구성된 기술침해대응자문단을 운영하도록 함(안 제8조의5 신설). 다. 기술 침해행위 조사 관련 자료제출요구에 응하지 아니한 자에게는 이행강제금을 부과할 수 있도록 함(안 제8조의6 신설). 라. 사업자등이 자료제출요구를 이행하지 아니하면서 정당한 이유를 소명하지 않은 경우 증명할 사실에 관한 신청인의 주장을 진실한 것으로 인정할 수 있도록 함(안 제8조의7 신설)."
        },
        {
            "billId": "PRC_N2G0P1O2D2D2I0F9J3N2U2T9G0A8R0",
            "billNo": 2106850,
            "age": 21,
            "billName": "형사소송법 일부개정법률안",
            "proposer": "이탄희의원등13인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-23",
            "currCommitteeId": "9700006",
            "currCommittee": "법제사법위원회",
            "committeeDate": "2020-12-24",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_N2G0P1O2D2D2I0F9J3N2U2T9G0A8R0",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 그동안 불기소결정문은 대부분 수사기밀이나 피의자의 개인정보 보호 등을 이유로 비공개 되어 왔음. 이로 인해 국민의 관심이 쏠린 공적인 사건이나 전관예우, 제 식구 감싸기 등의 의혹이 제기된 사건의 경우라도 검찰의 불기소 결정 이유를 정확히 확인하기 어렵고 검찰권 행사의 투명성을 담보하기 어렵다는 지적이 있어 왔음. 따라서 한편으로는 국민의 알권리와 검찰권 행사의 투명성을 증진하고, 한편으로는 수사기밀 또는 개인정보보호의 필요성과 조화시키기 위해 불기소된 피의자가 판·검사, 국회의원, 장관 등 일정한 경우에는 원칙적으로 그 내용을 공개하도록 함. 불기소결정문을 공개하는 경우, 피해자의 인적사항 등 개인정보의 보호를 위한 비실명화 조치 등을 취하도록 하되 변호인이 퇴직하고 일정한 기간 내에 있는 전관변호사 등 시행령으로 정하는 범위 내에 있는 변호사인 경우 변호인의 소속·이름을 공개할 수 있도록 허용함으로써 전관예우로 인해 사건처리의 공정성이 침해되지 않도록 감시하는 효과를 기대함. 한편 예외적으로 수사기밀의 보호를 위해 필요한 경우 불기소 결정을 한 검사의 요청에 따라 최대 6월의 범위 내에서 법무부장관이 불기소결정문 공개를 유예할 수 있도록 함. 이와 관련 「고위공직자범죄수사처 설립 및 운영에 관한 법률」상 고위공직자범죄수사처(이하 “수사처”라 함)에서 판·검사 관련 사건 등을 불기소하는 경우에도 같은 기준으로 수사처의 불기소결정문도 동일한 방법으로 공개하도록 할 필요가 있음. 이에 판·검사, 국회의원, 장관 등 관련 중요사건의 검찰과 수사처의 불기소결정문을 공개하도록 함으로써 검찰권 행사의 투명화를 확대하고 ‘전관예우’ 불신 해소를 통해 형사사법에 대한 국민의 신뢰를 제고하도록 하려는 것임(안 제259조의3)."
        },
        {
            "billId": "PRC_J2F0I1L2X0T2L1G7B5D7I3L3T6S2V6",
            "billNo": 2106346,
            "age": 21,
            "billName": "디자인보호법 일부개정법률안",
            "proposer": "이규민의원 등 16인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-10",
            "currCommitteeId": "9700481",
            "currCommittee": "산업통상자원중소벤처기업위원회",
            "committeeDate": "2020-12-11",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_J2F0I1L2X0T2L1G7B5D7I3L3T6S2V6",
            "procResultCode": "대안반영폐기",
            "procDate": "2021-07-23",
            "stage": "SUBSTITUTED_DISPOSAL",
            "overview": "제안이유 및 주요내용 현행법에 따르면 국가에 속하는 디자인등록출원 또는 디자인권 등의 경우에는 등록료 및 수수료(이하 “등록료등”이라 함)를 감면하고 있으나, 코로나19 등와 같은 국가적 재난상황이 발생한 경우 지원이 필요함에도 등록료등을 면제할 수 있는 근거 규정은 없음. 또한 「국민기초생활보장법」에 따른 의료급여 수급자와 같은 사회적 약자 등이 디자인등록출원하는 경우 등록료등을 감면해 주고 있으나, 출원에 기여하지 않은 감면 대상자를 출원인에 포함시켜 등록료등을 부당하게 감면받는 사례가 발생하고 있음. 아울러 디자인등록출원 후 1개월 내에 출원을 취하ㆍ포기하는 경우 출원료와 우선권주장 신청료는 출원인에게 반환해 주고 있으나 비밀디자인 청구료와 출원공개 신청료는 반환해 주지 않아 수수료 간에 불합리함이 존재함. 이에 재난 시에는 등록료등을 감면할 수 있는 근거를 마련하고, 부당하게 감면받은 등록료등에 대해서는 추징함과 동시에 해당 출원인의 감면혜택을 일정기간 제한하며, 비밀디자인 청구료와 출원공개 신청료를 반환대상에 포함하는 등 불합리한 수수료 규정을 개선하려는 것임(안 제86조 및 제87조)."
        },
        {
            "billId": "PRC_V2A0Y1B2E1Y0F1K6R4F7U3X0V0I5T0",
            "billNo": 2106347,
            "age": 21,
            "billName": "주차장법 일부개정법률안",
            "proposer": "임이자의원 등 10인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-10",
            "currCommitteeId": "9700407",
            "currCommittee": "국토교통위원회",
            "committeeDate": "2020-12-11",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_V2A0Y1B2E1Y0F1K6R4F7U3X0V0I5T0",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 현행법은 노상ㆍ노외주차장에서 주차요금을 내지 아니하거나 지정 주차구획 외의 곳에 주차하는 등 주차 제한행위가 발생하는 경우 주차장관리자가 해당 자동차의 운전자 또는 관리책임이 있는 자로부터 주차요금 외에 해당 지방자치단체 조례로 정하는 주차요금의 4배 이내의 가산금을 받을 수 있도록 하고 있고, 미납 시 지방세 체납처분의 예에 따라 그 주차요금과 가산금(이하 “주차요금등”이라 함)을 징수하도록 하고 있음. 이와 같이 주차요금 미납 등의 주차 제한행위에 대하여 가산금을 부과하도록 하는 것은 행정상 의무불이행에 대한 제재를 하기 위한 것이고, 미납 주차요금의 가산금의 납부대상으로 운전자 외에 관리책임이 있는 자를 규정한 사유는 고용 등의 법률관계에서 주차 제한행위를 한 운전자에 대한 관리책임이 있는 자에게도 그 책임을 공동으로 묻도록 하려는 것임. 그런데 최근 「여객자동차운수사업법」에 따른 자동차대여사업 또는 「여신전문금융업법」에 따른 시설대여업에 사용되는 자동차(이하 “대여용 자동차”라 함)에 대하여 노상ㆍ노외주차장관리자가 주차요금등의 징수 편의를 위하여 수익자부담 원칙을 위배하여 실제 사용자인 대여용 자동차의 임차인이나 리스 계약자가 아닌 사업자에게 해당차량의 관리책임을 물어 미납된 주차요금등을 부과하고 체납처분절차를 진행하는 사례가 나타나 논란이 되고 있음. 이에 현행법상의 미납 주차요금등의 납부대상자 중 관리책임이 있는 자에서 자동차만을 대여한 것이 명백한 자동차대여사업자나 시설대여업자를 제외하도록 함으로써 규정의 명확성을 제고하고, 주차요금등의 부당징수 논란을 해소하려는 것임(안 제9조제3항)."
        },
        {
            "billId": "PRC_N1V3P0W1P2T8Q0X9Y3A5Z5V0X4I5M3",
            "billNo": 1903428,
            "age": 19,
            "billName": "장기등 이식에 관한 법률 일부개정법률안",
            "proposer": "김우남의원 등 13인",
            "proposerKind": "의원",
            "proposeDate": "2013-01-28",
            "currCommitteeId": "9700341",
            "currCommittee": "보건복지위원회",
            "committeeDate": "2013-01-29",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_N1V3P0W1P2T8Q0X9Y3A5Z5V0X4I5M3",
            "procResultCode": "대안반영폐기",
            "procDate": "2013-06-27",
            "stage": "SUBSTITUTED_DISPOSAL",
            "overview": "■ 제안이유 및 주요내용 장기등 이식을 필요로 하는 이식대기자는 혈액, 체질 등 여러 생체학적인 환경이 가족들과 일치하기 때문에, 면역거부반응이 상대적으로 낮아 이식성공률이 높은 가족들로부터 장기등을 기증받아 이식을 시행하는 경우가 많음. 그러나 현행법에서 장기등 기증자가 이식대상자를 선정하지 않고 장기등을 기증하는 경우에만 병가나 유급휴가로 처리할 수 있으나, 가족 간의 장기등 기증인 경우에는 특정인을 지정하는 경우이기 때문에 병가나 유급휴가로 처리되지 않고 오히려 장기기증으로 인한 직장과 건강을 잃는 경우가 발생하기도 하여, 가족간 장기등 기증자가 신체적·정신적·사회적 및 경제적 고통에 시달리고 있음. 따라서 「민법」에 따른 배우자, 직계혈족 및 형제자매 간에 장기등 기증을 하는 경우에도 병가나 유급휴가로 처리하도록 규정함으로써, 가족 간의 장기등 기증에 따른 어려움을 해소하고 장기등 기증을 활성화하여 국민건강을 보호하려는 것임(안 제32조제2항제2호 신설)."
        },
        {
            "billId": "PRC_Y2N0R1D2M1O0O1F6D4B9Y1O0K3H0W2",
            "billNo": 2106348,
            "age": 21,
            "billName": "수도법 일부개정법률안",
            "proposer": "임이자의원 등 10인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-10",
            "currCommitteeId": "9700038",
            "currCommittee": "환경노동위원회",
            "committeeDate": "2020-12-11",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_Y2N0R1D2M1O0O1F6D4B9Y1O0K3H0W2",
            "procResultCode": "대안반영폐기",
            "procDate": "2021-12-09",
            "stage": "SUBSTITUTED_DISPOSAL",
            "overview": "제안이유 및 주요내용 상수원보호구역에 취수시설, 정수시설, 공공하수처리시설 또는 공공목적의 시설을 설치할 수 있으며, 이들 시설에서는 수처리제, 중화제, 소독제, 시험분석용 등으로 가성소다, 액체염소, 염산, 황산 등 유해화학물질을 사용하고 있고, 유해화학물질을 사용하는 행위를 할 수 없도록 하는 수도법 일부개정법률 시행일(2012. 1. 29.), 유해화학물질 고시일 또는 상수원보호구역 지정일 이전부터 유해화학물질을 사용해온 사업장에 대하여도 유해화학물질을 일체 사용할 수 없도록 한 수도법 제7조의 규정은 매우 불합리함. 이에 취수시설, 정수시설, 공공하수처리시설, 공공폐수처리시설 및 국가ㆍ지방자치단체의 시험ㆍ분석ㆍ연구기관에서 유해화학물질을 수처리제, 중화제, 소독제 또는 시약으로 사용할 수 있도록 하고, 유해화학물질을 사용하는 행위를 할 수 없도록 하는 「수도법」 일부개정법률 시행일, 「화학물질관리법」 제2조에 따른 유해화학물질로 된 날 또는 상수원보호구역 지정일 이전부터 유해화학물질을 사용한 사업장에서는 해당 유해화학물질을 계속하여 사용하게 하거나 대체 유해화학물질을 사용할 수 있도록 하고자 함(안 제7조제3항 등)."
        },
        {
            "billId": "PRC_F2Y0L1L2Y1Q5V1P1N0R5J2O2G7K9U6",
            "billNo": 2106617,
            "age": 21,
            "billName": "세종특별자치시 설치 등에 관한 특별법 일부개정법률안",
            "proposer": "임호선의원등15인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-16",
            "currCommitteeId": "9700480",
            "currCommittee": "행정안전위원회",
            "committeeDate": "2020-12-17",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_F2Y0L1L2Y1Q5V1P1N0R5J2O2G7K9U6",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 헌법상 기본원리인 법치주의 실현을 위해서는 법률이 올바른 용어로 표현되어 있어서 일반 국민이라면 누구나 그 내용을 쉽게 이해하고 법을 잘 지킬 수 있어야 함. 그러나 현행 법률 중 여전히 일본식 표현을 사용하는 경우가 있어 국민의 일상 언어생활과 거리가 있다는 지적을 받고 있음. 입법권에 대한 권한과 책임을 부여받은 국회는 사회 변화에 맞추어 왜곡된 법률용어와 문장을 한글화하고 이해하기 쉽게 표현하도록 노력할 필요가 있음. 이를 위해 일본식 용어 등을 한글화하거나 보다 쉬운 표현으로 개정함으로써 법률에 대한 국민의 이해 정도와 접근가능성을 확장시키고 국회에 대한 국민의 신뢰를 높이는 데에 기여하고자 함(안 제15조)."
        },
        {
            "billId": "PRC_Z2B0W1A2U1O5Q1S1X2Y9L4C2R4P4P9",
            "billNo": 2106619,
            "age": 21,
            "billName": "국제수형자이송법 일부개정법률안",
            "proposer": "김남국의원등14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-16",
            "currCommitteeId": "9700006",
            "currCommittee": "법제사법위원회",
            "committeeDate": "2020-12-17",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_Z2B0W1A2U1O5Q1S1X2Y9L4C2R4P4P9",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 헌법상 기본원리인 법치주의 실현을 위해서는 법률이 올바른 용어로 표현되어 있어서 일반 국민이라면 누구나 그 내용을 쉽게 이해하고 법을 잘 지킬 수 있어야 함. 그러나 현행 법률 중 여전히 일본식 표현을 사용하는 경우가 있어 국민의 일상 언어생활과 거리가 있다는 지적을 받고 있음. 입법권에 대한 권한과 책임을 부여받은 국회는 사회 변화에 맞추어 왜곡된 법률용어와 문장을 한글화하고 이해하기 쉽게 표현하도록 노력할 필요가 있음. 이를 위해 일본식 용어 등을 한글화하거나 보다 쉬운 표현으로 개정함으로써 법률에 대한 국민의 이해 정도와 접근가능성을 확장시키고 국회에 대한 국민의 신뢰를 높이는 데에 기여하고자 함(안 제33조)."
        },
        {
            "billId": "PRC_R2U0K1Z2W1F5Q1F1I3C0Y2V9I4V3Y9",
            "billNo": 2106620,
            "age": 21,
            "billName": "민사집행법 일부개정법률안",
            "proposer": "김남국의원등14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-16",
            "currCommitteeId": "9700006",
            "currCommittee": "법제사법위원회",
            "committeeDate": "2020-12-17",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_R2U0K1Z2W1F5Q1F1I3C0Y2V9I4V3Y9",
            "procResultCode": "원안가결",
            "procDate": "2021-12-09",
            "stage": "PROMULGATION",
            "overview": "제안이유 및 주요내용 헌법상 기본원리인 법치주의 실현을 위해서는 법률이 올바른 용어로 표현되어 있어서 일반 국민이라면 누구나 그 내용을 쉽게 이해하고 법을 잘 지킬 수 있어야 함. 그러나 현행 법률 중 여전히 일본식 표현을 사용하는 경우가 있어 국민의 일상 언어생활과 거리가 있다는 지적을 받고 있음. 입법권에 대한 권한과 책임을 부여받은 국회는 사회 변화에 맞추어 왜곡된 법률용어와 문장을 한글화하고 이해하기 쉽게 표현하도록 노력할 필요가 있음. 이를 위해 일본식 용어 등을 한글화하거나 보다 쉬운 표현으로 개정함으로써 법률에 대한 국민의 이해 정도와 접근가능성을 확장시키고 국회에 대한 국민의 신뢰를 높이는 데에 기여하고자 함(안 제84조제1항 및 제246조제1항)."
        },
        {
            "billId": "PRC_A2W0F1Q2L1V5J1U0T1D7G2H6J8V0I3",
            "billNo": 2106621,
            "age": 21,
            "billName": "신용정보의 이용 및 보호에 관한 법률 일부개정법률안",
            "proposer": "이용우의원등14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-16",
            "currCommitteeId": "9700008",
            "currCommittee": "정무위원회",
            "committeeDate": "2020-12-17",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_A2W0F1Q2L1V5J1U0T1D7G2H6J8V0I3",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 헌법상 기본원리인 법치주의 실현을 위해서는 법률이 올바른 용어로 표현되어 있어서 일반 국민이라면 누구나 그 내용을 쉽게 이해하고 법을 잘 지킬 수 있어야 함. 그러나 현행 법률 중 여전히 일본식 표현을 사용하는 경우가 있어 국민의 일상 언어생활과 거리가 있다는 지적을 받고 있음. 입법권에 대한 권한과 책임을 부여받은 국회는 사회 변화에 맞추어 왜곡된 법률용어와 문장을 한글화하고 이해하기 쉽게 표현하도록 노력할 필요가 있음. 이를 위해 일본식 용어 등을 한글화하거나 보다 쉬운 표현으로 개정함으로써 법률에 대한 국민의 이해 정도와 접근가능성을 확장시키고 국회에 대한 국민의 신뢰를 높이는 데에 기여하고자 함(안 제9조의2제5항, 제20조제3항)."
        },
        {
            "billId": "PRC_R2O0Q1A2U1F5N1E0K1J9U0F8B7F2Z8",
            "billNo": 2106622,
            "age": 21,
            "billName": "전자금융거래법 일부개정법률안",
            "proposer": "이용우의원등14인",
            "proposerKind": "의원",
            "proposeDate": "2020-12-16",
            "currCommitteeId": "9700008",
            "currCommittee": "정무위원회",
            "committeeDate": "2020-12-17",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_R2O0Q1A2U1F5N1E0K1J9U0F8B7F2Z8",
            "procResultCode": null,
            "procDate": null,
            "stage": "COMMITTEE_REVIEW",
            "overview": "제안이유 및 주요내용 헌법상 기본원리인 법치주의 실현을 위해서는 법률이 올바른 용어로 표현되어 있어서 일반 국민이라면 누구나 그 내용을 쉽게 이해하고 법을 잘 지킬 수 있어야 함. 그러나 현행 법률 중 여전히 일본식 표현을 사용하는 경우가 있어 국민의 일상 언어생활과 거리가 있다는 지적을 받고 있음. 입법권에 대한 권한과 책임을 부여받은 국회는 사회 변화에 맞추어 왜곡된 법률용어와 문장을 한글화하고 이해하기 쉽게 표현하도록 노력할 필요가 있음. 이를 위해 일본식 용어 등을 한글화하거나 보다 쉬운 표현으로 개정함으로써 법률에 대한 국민의 이해 정도와 접근가능성을 확장시키고 국회에 대한 국민의 신뢰를 높이는 데에 기여하고자 함(안 제13조제2항, 제21조의2, 제23조제1항, 제28조제3항)."
        },
        {
            "billId": "PRC_R1E3H0W1B2W8T1L8B0L8G2P2I6E7Z3",
            "billNo": 1903447,
            "age": 19,
            "billName": "지방교육자치에 관한 법률 일부개정법률안",
            "proposer": "박혜자의원 등 12인",
            "proposerKind": "의원",
            "proposeDate": "2013-01-28",
            "currCommitteeId": "9700406",
            "currCommittee": "교육문화체육관광위원회",
            "committeeDate": "2013-01-29",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_R1E3H0W1B2W8T1L8B0L8G2P2I6E7Z3",
            "procResultCode": "원안가결",
            "procDate": "2013-12-10",
            "stage": "PROMULGATION",
            "overview": "■ 제안이유 및 주요내용 2010년 9월 1일 개정된 현행법 시행령에서는 시·군 및 자치구를 관할 구역으로 하는 지역교육청의 명칭을 교육지원청으로 변경하였으나, “지역교육청”과 “교육청”이라는 명칭이 여전히 혼재되어 쓰이고 있음. 이에 1개 또는 2개 이상의 시·군 및 자치구를 관할 구역으로 하는 하급교육행정기관을 교육지원청으로 통일하려는 것임(안 제34조)."
        },
        {
            "billId": "PRC_C1J3Z0O1D2C9P1M6C4D2R1B5M3J7L8",
            "billNo": 1903455,
            "age": 19,
            "billName": "건설근로자의 고용개선 등에 관한 법률 일부개정법률안",
            "proposer": "이완영의원 등 10인",
            "proposerKind": "의원",
            "proposeDate": "2013-01-29",
            "currCommitteeId": "9700038",
            "currCommittee": "환경노동위원회",
            "committeeDate": "2013-01-30",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_C1J3Z0O1D2C9P1M6C4D2R1B5M3J7L8",
            "procResultCode": "임기만료폐기",
            "procDate": "2016-05-29",
            "stage": "AGE_EXPIRE_DISPOSAL",
            "overview": "제안이유 건설업은 기후적인 영향이 크고 외국인 근로자의 일자리 잠식이 큰 등 타 산업과 구별되는 특성을 고려하여 고용 및 복지사업을 실시할 필요가 있음. 따라서 건설기본계획에 ‘외국인 건설근로자 인력수급의 체계적인 관리에 관한 사항’를 포함시키고, 악천후？동절기 등에 계절실업대책을 수립？시행하며, 기존 직업훈련의 제한을 완화하고 지원을 우대하여 건설근로자에게 특화된 직업능력개발사업을 실시하고자 함. 건고법은 건설(일용)근로자의 고용안정 및 복지증진을 위한 유일한 근거법률임에도 불구하고, 公的 정책전달기구인 건설근로자공제회의 임원 및 의사결정 체계 관련 규정의 미비로 투명성？책임성 확보가 어려운 상황임. 따라서 이사장 등 임원의 선임？연임 절차 등을 정하고, 사업주단체가 다수 참여하고 있는 이사회를 노？사 동수로 구성하여 균형을 맞추며, 매년 이사장의 경영계약 체결 및 성과평가를 통해 공제회 운영의 책임성을 확보하고자 함. 또한 노무비 구분관리 및 지급확인제도, 임금지급 보증제도 등 건설근로자 임금 보호를 위해 시행이 시급한 제도를 도입하고, 공제부금 일액을 상향조정하며, 건설기계종사자를 퇴직공제대상에 포함하여 건설근로자를 위한 사회안전망을 두텁게 하려는 것임. 주요내용 가. 퇴직공제의 보호 대상에 건설분야 특수고용직(건설기계종사자)를 포함시킴으로서 법의 제목을 “건설근로자 등의 고용개선 및 복지증진에 관한 법률”로 변경함. 나. 법의 목적에 “건설근로자”를 “건설근로자 등”으로 변경하고, “임금 지급 보장”을 추가함(안 제1조). 다. 건설기본계획에 ‘외국인 건설근로자 인력수급의 체계적인 관리에 관한 사항’를 추가하고, 고용노동부장광관이 실시하는 사업에 ‘계절실업대책 수립？시행’을 추가(안 제3조, 제7조) 라. 건설근로자의 직업능력개발을 위해 사업주가 건설기능관련 직종에 필요한 향상 및 양성훈련 사업을 실시하는 경우에는 훈련 실시요건을 완화하고 지원수준을 높게 정할 수 있도록 특례조항을 둠(안 제7조의3) 마. “노무비 구분관리 및 지급확인제”를 도입하여 대통령령으로 정하는 건설공사의 도급인이 수급인에게 지불하여야 할 공사대금 중 노무비를 다른 비용과 구분하여 지급하되, 이전까지 지급받은 노무비의 사용여부를 확인한 후 지급하도록 함(안 제7조의4). 바. “건설근로자 임금 지급보증제도”를 도입하여 건설공사를 행하는 사업주에게 그 공사를 위해 고용된 건설근로자에 대한 임금의 지급보증 의무를 부과하고, 임금체불 등 보증금 지급 사유 발생 시 보증기관이 건설근로자에게 보증금을 지급하도록 함(안 제7조의5, 제7조의6). 사. 건설근로자공제회의 명칭을 ‘건설근로자 고용복지재단’으로 변경함(안 제9조). 아. 이사회의 구성인원을 축소(20명→15명)하고, 이사회 구성을 건설 관련 사업주단체의 장 위주에서 노？사 동수로 개편하여 의사결정의 균형을 유지하도록 함(안 제9조의4). 자. 임원의 임명에 관하여 이사장은 임원추천위원회가 추천하고 이사회가 심의？의결한 자 중에서 고용노동부장관이 임명하도록 함. 또한 임기를 3년으로 정하고, 이사장이 재단의 경영성과를 책임지도록 함(안 제9조의6). 차. 이사장이 직무 수행에 현저히 지장이 있는 행동을 할 경우 이사회가 의결을 통해 이사장 해임을 요청할 수 있도록 하며, 필요시 비상임이사가 재단에 감사나 자료를 요구할 수 있도록 함(안 제9조의7). 카. 이사장 임명 시 이사회가 경영목표 등 계약사항을 정하고 고용노동부장관과 성과계약을 체결하며, 이에 따라 매년 중장기 경영목표를 수립하여 제출하도록 함(안 제9조의8, 제9조의9). 타. 재단은 매년 이사장의 경영실적 및 성과계약 이행 여부를 보고서로 제출하고, 고용노동부장관은 이사회가 정한 규정에 따라 이를 평가하여 이사회가 정한 기준에 미달 시 이사장을 해임할 수 있도록 함(안 제9조의10). 파. 건설기계사업자에 대한 특례조항을 신설하여 퇴직공제제도 임의가입 대상에 포함시킴(안 제10조의5). 하. 콘크리트 믹서트럭 운전자는 보통 특정 사업장에 종속되어 노무를 제공하므로, 전속성을 고려하여 운전자를 퇴직공제의 가입대상에 포함시킴(안 제11조). 거. 콘크리트 믹서트럭 운전자의 경우 운전자와 사업주가 각각 공제부금의 50%를 부담하도록 정하고, 피공제자가 타 사회보험 자료 등을 통해 자신의 근로내역을 입증하여 근로일수를 신고하는 경우 공제회가 이를 승인하여 사업주의 공제부금에 가산하는 제도를 도입하며, 공제부금의 금액은 ‘1일 5천원 이상 1만원 이하’로 상향조정함(안 제13조). 너. 도급인과 수급인이 합의한 경우 및 발주자가 공제부금 미납 사유를 제공한 경우 등에는 공제회가 도급인에게 공제부금 납부를 요구할 수 있도록 함(안 제13조의2) 더. 퇴직공제 피공제자의 주소？연락처 등이 신고내용과 다르거나 부정확한 경우가 많아 관계 행정기관에 정보를 요청할 필요가 있는 경우 관계기관에 자료의 제출을 요청할 수 있도록 함(안 제13조의3) 러. 피공제자의 공제부금 납부월수가 12개월 미만인 경우에도 65세에도달하거나 사망한 경우 퇴직공제금을 지급하도록 요건 완화(안 제14조). 머. 법 제23조제1항에서 발주자를 지도감독 대상에 포함시키고, 동조 제2항에서 공제회가 발주자에게 필요한 보고나 관계서류를 제출할 수 있도록 하는 등 발주자에 대한 지도감독 권한 신설(안 제23조). 버. 고용부 장관의 권한을 지방고용노동관서에 위임할 수 있는 법적 근거를 마련함(안 제23조의2). 서. 거짓이나 그 밖의 부정한 방법으로 임금지급 보증금을 받은 자 및 지급받게 한 자에게 징역 또는 벌금 부과(안 제24조). 어. 노무비 구분관리 및 지급확인제도, 임금지급 보증제도, 퇴직공제제도 등 시행 시 발생하는 각종 의무 미이행에 대한 과태료 정비(제26조)."
        },
        {
            "billId": "PRC_L1S3E0S1O2P9V1F7S2H8R4S8H7L1X3",
            "billNo": 1903456,
            "age": 19,
            "billName": "유통산업발전법 일부개정법률안",
            "proposer": "조경태의원 등 10인",
            "proposerKind": "의원",
            "proposeDate": "2013-01-29",
            "currCommitteeId": "9700410",
            "currCommittee": "산업통상자원위원회",
            "committeeDate": "2013-01-30",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_L1S3E0S1O2P9V1F7S2H8R4S8H7L1X3",
            "procResultCode": "임기만료폐기",
            "procDate": "2016-05-29",
            "stage": "AGE_EXPIRE_DISPOSAL",
            "overview": "제안이유 및 주요내용 현행법은 대기업의 지역상권 진출로부터 전통시장과 골목상권을 보호하기 위하여 대규모점포와 전통상업보존지역에 개설하려는 준대규모점포에 대하여 등록제를 시행하고 있음. 그러나 현행법상의 대규모점포나 준대규모점포에 해당되지 않는 기업형 중형 슈퍼마켓이나 개인이 운영하는 독립형 슈퍼마켓도 그 규모가 큰 경우 전통시장과 골목상권의 수요를 독점하여 중소영세상인과 상생할 수 있는 유통환경에 악영향을 줄 수 있음. 이에 지역경제의 상생발전을 위하여 준대규모점포에 매장면적의 합계가 660제곱미터 이상 3천제곱미터 미만인 점포를 포함시키려는 것임(안 제2조제4호라목 신설)."
        },
        {
            "billId": "PRC_E1K3Y0Q1X3Q0O2E1C4F9I1B8O9D6E1",
            "billNo": 1903508,
            "age": 19,
            "billName": "생명공학육성법 일부개정법률안",
            "proposer": "이한구의원 등 152인",
            "proposerKind": "의원",
            "proposeDate": "2013-01-30",
            "currCommitteeId": "9700303",
            "currCommittee": "교육과학기술위원회",
            "committeeDate": "2013-01-30",
            "committeeProcDate": null,
            "url": "https://likms.assembly.go.kr/bill/billDetail.do?billId=PRC_E1K3Y0Q1X3Q0O2E1C4F9I1B8O9D6E1",
            "procResultCode": "수정가결",
            "procDate": "2013-03-22",
            "stage": "PROMULGATION",
            "overview": "제안이유 및 주요내용 과학기술과 정보통신기술을 통해 창조경제의 기반을 구축하기 위하여 미래창조과학부를 신설하는 내용으로 「정부조직법」이 개정되는 것에 맞추어 생명공학 육성에 관한 기본계획 수립 및 종합 조정 등의 업무를 교육과학기술부에서 미래창조과학부로 이관하는 등 관련 부처간 업무 분장을 조정하려는 것임."
        }
    ],
    "pageable": {
        "sort": {
            "sorted": false,
            "unsorted": true,
            "empty": true
        },
        "pageNumber": 0,
        "pageSize": 20,
        "offset": 0,
        "unpaged": false,
        "paged": true
    },
    "last": false,
    "totalElements": 91690,
    "totalPages": 4585,
    "first": true,
    "numberOfElements": 20,
    "size": 20,
    "number": 0,
    "sort": {
        "sorted": false,
        "unsorted": true,
        "empty": true
    },
    "empty": false
}
''';